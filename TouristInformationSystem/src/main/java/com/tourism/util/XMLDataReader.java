package com.tourism.util;

import com.tourism.model.Destination;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Utility class for reading and querying destination data from destinations.xml.
 * Implements secure XML parsing to prevent XML External Entity (XXE) attacks
 * and caches destinations in memory for efficient retrieval.
 */
public class XMLDataReader {

    private static final Logger LOGGER = Logger.getLogger(XMLDataReader.class.getName());
    private static final String XML_RESOURCE_NAME = "destinations.xml";

    // In-memory cached list of destinations
    private static volatile List<Destination> cachedDestinations = null;
    private static final Object LOCK = new Object();

    // Private constructor to prevent instantiation
    private XMLDataReader() {
    }

    /**
     * Retrieves all destinations parsed from the XML data store.
     * Uses double-checked locking for thread-safe lazy caching.
     *
     * @return List of Destination objects, unmodifiable
     */
    public static List<Destination> getAllDestinations() {
        if (cachedDestinations == null) {
            synchronized (LOCK) {
                if (cachedDestinations == null) {
                    cachedDestinations = parseDestinationsXml();
                }
            }
        }
        return Collections.unmodifiableList(cachedDestinations);
    }

    /**
     * Forces a reload of the XML file to refresh the cache.
     */
    public static void reload() {
        synchronized (LOCK) {
            cachedDestinations = parseDestinationsXml();
        }
    }

    /**
     * Returns featured destinations for the home page showcase.
     *
     * @return List of featured destinations
     */
    public static List<Destination> getFeaturedDestinations() {
        List<Destination> all = getAllDestinations();
        List<Destination> featured = new ArrayList<>();
        for (Destination d : all) {
            if (d.isFeatured()) {
                featured.add(d);
            }
        }
        // Fallback: If no destinations are explicitly flagged featured, return the first 4
        if (featured.isEmpty() && !all.isEmpty()) {
            return all.subList(0, Math.min(4, all.size()));
        }
        return featured;
    }

    /**
     * Finds a single destination by its unique ID.
     *
     * @param id The unique string ID (e.g., "taj-mahal")
     * @return Destination if found, or null if not found or id is invalid
     */
    public static Destination getDestinationById(String id) {
        if (id == null || id.trim().isEmpty()) {
            return null;
        }
        String cleanId = id.trim();
        for (Destination d : getAllDestinations()) {
            if (d.getId().equalsIgnoreCase(cleanId)) {
                return d;
            }
        }
        return null;
    }

    /**
     * Searches and filters destinations based on query, category, and state.
     * All criteria are applied together (conjunction / AND).
     *
     * @param query    Search text matching name, city, or state (case-insensitive)
     * @param category Selected category (or "all" / empty / null)
     * @param state    Selected state (or "all" / empty / null)
     * @return Filtered list of destinations
     */
    public static List<Destination> searchAndFilter(String query, String category, String state) {
        List<Destination> all = getAllDestinations();
        List<Destination> results = new ArrayList<>();

        String cleanQuery = (query != null) ? query.trim().toLowerCase() : "";
        String cleanCategory = (category != null) ? category.trim() : "";
        String cleanState = (state != null) ? state.trim() : "";

        boolean filterCategory = !cleanCategory.isEmpty() && !"all".equalsIgnoreCase(cleanCategory);
        boolean filterState = !cleanState.isEmpty() && !"all".equalsIgnoreCase(cleanState);
        boolean filterQuery = !cleanQuery.isEmpty();

        for (Destination d : all) {
            // Check query match (in name, city, or state)
            boolean queryMatches = true;
            if (filterQuery) {
                boolean matchName = d.getName() != null && d.getName().toLowerCase().contains(cleanQuery);
                boolean matchCity = d.getCity() != null && d.getCity().toLowerCase().contains(cleanQuery);
                boolean matchState = d.getState() != null && d.getState().toLowerCase().contains(cleanQuery);
                queryMatches = matchName || matchCity || matchState;
            }

            // Check category match
            boolean categoryMatches = true;
            if (filterCategory) {
                categoryMatches = d.getCategory() != null && d.getCategory().equalsIgnoreCase(cleanCategory);
            }

            // Check state match
            boolean stateMatches = true;
            if (filterState) {
                stateMatches = d.getState() != null && d.getState().equalsIgnoreCase(cleanState);
            }

            if (queryMatches && categoryMatches && stateMatches) {
                results.add(d);
            }
        }

        return results;
    }

    /**
     * Extracts an alphabetically sorted list of unique categories.
     *
     * @return Sorted list of distinct categories
     */
    public static List<String> getAllCategories() {
        Set<String> categories = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        for (Destination d : getAllDestinations()) {
            if (d.getCategory() != null && !d.getCategory().trim().isEmpty()) {
                categories.add(d.getCategory().trim());
            }
        }
        return new ArrayList<>(categories);
    }

    /**
     * Extracts an alphabetically sorted list of unique states.
     *
     * @return Sorted list of distinct states
     */
    public static List<String> getAllStates() {
        Set<String> states = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        for (Destination d : getAllDestinations()) {
            if (d.getState() != null && !d.getState().trim().isEmpty()) {
                states.add(d.getState().trim());
            }
        }
        return new ArrayList<>(states);
    }

    /**
     * Parses destinations.xml from the application classpath.
     * Configures the XML parser with security features to prevent XXE attacks.
     *
     * @return List of parsed Destination objects
     */
    private static List<Destination> parseDestinationsXml() {
        List<Destination> destinations = new ArrayList<>();

        // Locate the XML file from the classpath
        InputStream is = XMLDataReader.class.getClassLoader().getResourceAsStream(XML_RESOURCE_NAME);
        if (is == null) {
            // Also attempt context class loader as fallback
            ClassLoader ccl = Thread.currentThread().getContextClassLoader();
            if (ccl != null) {
                is = ccl.getResourceAsStream(XML_RESOURCE_NAME);
            }
        }

        if (is == null) {
            LOGGER.log(Level.SEVERE, "Could not find " + XML_RESOURCE_NAME + " on the classpath!");
            return destinations;
        }

        try (InputStream stream = is) {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

            // ====================================================================
            // XXE Prevention Settings (OWASP Best Practices)
            // ====================================================================
            // 1. Completely disable DOCTYPE declarations
            try {
                dbf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
            } catch (Exception e) {
                LOGGER.log(Level.FINE, "Feature disallow-doctype-decl not supported", e);
            }

            // 2. Disable external general entities
            try {
                dbf.setFeature("http://xml.org/sax/features/external-general-entities", false);
            } catch (Exception e) {
                LOGGER.log(Level.FINE, "Feature external-general-entities not supported", e);
            }

            // 3. Disable external parameter entities
            try {
                dbf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
            } catch (Exception e) {
                LOGGER.log(Level.FINE, "Feature external-parameter-entities not supported", e);
            }

            // 4. Disable loading of external DTDs
            try {
                dbf.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
            } catch (Exception e) {
                LOGGER.log(Level.FINE, "Feature load-external-dtd not supported", e);
            }

            // 5. Disable XInclude processing and entity expansion
            dbf.setXIncludeAware(false);
            dbf.setExpandEntityReferences(false);

            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(stream);
            doc.getDocumentElement().normalize();

            NodeList destinationNodes = doc.getElementsByTagName("destination");
            for (int i = 0; i < destinationNodes.getLength(); i++) {
                Node node = destinationNodes.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element elem = (Element) node;

                    Destination d = new Destination();
                    d.setId(elem.getAttribute("id"));
                    d.setName(getElementText(elem, "name"));
                    d.setCity(getElementText(elem, "city"));
                    d.setState(getElementText(elem, "state"));
                    d.setCategory(getElementText(elem, "category"));
                    d.setShortDescription(getElementText(elem, "shortDescription"));
                    d.setDescription(getElementText(elem, "description"));
                    d.setBestTimeToVisit(getElementText(elem, "bestTimeToVisit"));
                    d.setEstimatedBudget(getElementText(elem, "estimatedBudget"));
                    d.setRecommendedDuration(getElementText(elem, "recommendedDuration"));
                    d.setImagePath(getElementText(elem, "imagePath"));
                    d.setFeatured("true".equalsIgnoreCase(getElementText(elem, "featured")));

                    // Parse attractions list
                    NodeList attractionList = elem.getElementsByTagName("attraction");
                    for (int j = 0; j < attractionList.getLength(); j++) {
                        Node attNode = attractionList.item(j);
                        if (attNode != null && attNode.getTextContent() != null) {
                            d.addAttraction(attNode.getTextContent().trim());
                        }
                    }

                    // Parse travel tips list
                    NodeList tipList = elem.getElementsByTagName("tip");
                    for (int k = 0; k < tipList.getLength(); k++) {
                        Node tipNode = tipList.item(k);
                        if (tipNode != null && tipNode.getTextContent() != null) {
                            d.addTravelTip(tipNode.getTextContent().trim());
                        }
                    }

                    destinations.add(d);
                }
            }

            LOGGER.log(Level.INFO, "Successfully loaded " + destinations.size() + " destinations from XML.");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error parsing " + XML_RESOURCE_NAME + ": " + e.getMessage(), e);
        }

        return destinations;
    }

    /**
     * Safely retrieves text content from a child element.
     */
    private static String getElementText(Element parent, String tagName) {
        NodeList list = parent.getElementsByTagName(tagName);
        if (list != null && list.getLength() > 0) {
            Node node = list.item(0);
            if (node != null && node.getTextContent() != null) {
                return node.getTextContent().trim();
            }
        }
        return "";
    }
}
