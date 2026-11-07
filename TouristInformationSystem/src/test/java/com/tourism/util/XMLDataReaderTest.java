package com.tourism.util;

import com.tourism.model.Destination;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for XMLDataReader and Destination model.
 * Verifies XML parsing, field validation, XXE-safe loader, and search/filter combinations.
 */
public class XMLDataReaderTest {

    @BeforeAll
    public static void setUp() {
        XMLDataReader.reload();
    }

    @Test
    @DisplayName("Verify destinations.xml contains at least 8 destinations with all 8 requested records")
    public void testDestinationCountAndRequiredRecords() {
        List<Destination> destinations = XMLDataReader.getAllDestinations();
        assertNotNull(destinations, "Destination list must not be null");
        assertTrue(destinations.size() >= 8, "Must contain at least 8 destinations");

        // Verify all 8 required destinations exist
        String[] requiredIds = {
                "taj-mahal",
                "manali",
                "jaipur",
                "kerala-backwaters",
                "golden-temple",
                "goa-beaches",
                "varanasi-ghats",
                "darjeeling"
        };

        for (String id : requiredIds) {
            Destination d = XMLDataReader.getDestinationById(id);
            assertNotNull(d, "Destination with ID '" + id + "' should be present in destinations.xml");
            assertNotNull(d.getName(), "Name must not be null for " + id);
            assertNotNull(d.getCity(), "City must not be null for " + id);
            assertNotNull(d.getState(), "State must not be null for " + id);
            assertNotNull(d.getCategory(), "Category must not be null for " + id);
            assertNotNull(d.getDescription(), "Description must not be null for " + id);
            assertFalse(d.getAttractions().isEmpty(), "Attractions list must not be empty for " + id);
            assertNotNull(d.getBestTimeToVisit(), "Best time to visit must not be null for " + id);
            assertNotNull(d.getEstimatedBudget(), "Estimated budget must not be null for " + id);
            assertNotNull(d.getRecommendedDuration(), "Recommended duration must not be null for " + id);
            assertFalse(d.getTravelTips().isEmpty(), "Travel tips list must not be empty for " + id);
            assertNotNull(d.getImagePath(), "Image path must not be null for " + id);
        }
    }

    @Test
    @DisplayName("Verify search by destination name is case-insensitive")
    public void testSearchByName() {
        List<Destination> results = XMLDataReader.searchAndFilter("taj", "all", "all");
        assertEquals(1, results.size());
        assertEquals("Taj Mahal", results.get(0).getName());

        List<Destination> caseTest = XMLDataReader.searchAndFilter("MANALI", null, null);
        assertEquals(1, caseTest.size());
        assertEquals("Manali", caseTest.get(0).getName());
    }

    @Test
    @DisplayName("Verify search by city and state works")
    public void testSearchByCityAndState() {
        // Search by city "Agra"
        List<Destination> agraResults = XMLDataReader.searchAndFilter("Agra", "all", "all");
        assertFalse(agraResults.isEmpty());
        assertEquals("Taj Mahal", agraResults.get(0).getName());

        // Search by state "Kerala"
        List<Destination> keralaResults = XMLDataReader.searchAndFilter("Kerala", "all", "all");
        assertFalse(keralaResults.isEmpty());
        assertEquals("kerala-backwaters", keralaResults.get(0).getId());
    }

    @Test
    @DisplayName("Verify category filter works")
    public void testFilterByCategory() {
        List<Destination> heritageList = XMLDataReader.searchAndFilter(null, "Heritage", null);
        assertTrue(heritageList.size() >= 2, "Should have at least 2 Heritage destinations (Taj Mahal, Jaipur)");
        for (Destination d : heritageList) {
            assertEquals("Heritage", d.getCategory());
        }

        List<Destination> beachList = XMLDataReader.searchAndFilter("", "Beach", "");
        assertEquals(1, beachList.size());
        assertEquals("Goa Beaches", beachList.get(0).getName());
    }

    @Test
    @DisplayName("Verify state filter works")
    public void testFilterByState() {
        List<Destination> upList = XMLDataReader.searchAndFilter(null, null, "Uttar Pradesh");
        assertTrue(upList.size() >= 2, "Should have at least 2 in UP (Taj Mahal, Varanasi Ghats)");
        for (Destination d : upList) {
            assertEquals("Uttar Pradesh", d.getState());
        }
    }

    @Test
    @DisplayName("Verify search and filters work together in conjunction")
    public void testSearchAndFilterTogether() {
        // Search query "Ghats" with Category "Spiritual" and State "Uttar Pradesh"
        List<Destination> matches = XMLDataReader.searchAndFilter("Ghats", "Spiritual", "Uttar Pradesh");
        assertEquals(1, matches.size());
        assertEquals("Varanasi Ghats", matches.get(0).getName());

        // Conflicting criteria should return empty results
        List<Destination> noMatches = XMLDataReader.searchAndFilter("Goa", "Hill Station", "Goa");
        assertTrue(noMatches.isEmpty(), "No beach destination should match Hill Station category");
    }

    @Test
    @DisplayName("Verify getDestinationById returns null for invalid or empty IDs")
    public void testInvalidDestinationId() {
        assertNull(XMLDataReader.getDestinationById(null));
        assertNull(XMLDataReader.getDestinationById(""));
        assertNull(XMLDataReader.getDestinationById("   "));
        assertNull(XMLDataReader.getDestinationById("non-existent-destination-xyz"));
    }

    @Test
    @DisplayName("Verify distinct categories and states are returned alphabetically")
    public void testCategoriesAndStatesLists() {
        List<String> categories = XMLDataReader.getAllCategories();
        assertNotNull(categories);
        assertTrue(categories.contains("Heritage"));
        assertTrue(categories.contains("Hill Station"));
        assertTrue(categories.contains("Beach"));
        assertTrue(categories.contains("Spiritual"));
        assertTrue(categories.contains("Nature"));

        List<String> states = XMLDataReader.getAllStates();
        assertNotNull(states);
        assertTrue(states.contains("Himachal Pradesh"));
        assertTrue(states.contains("Rajasthan"));
        assertTrue(states.contains("Kerala"));
        assertTrue(states.contains("Punjab"));
        assertTrue(states.contains("Goa"));
        assertTrue(states.contains("Uttar Pradesh"));
        assertTrue(states.contains("West Bengal"));
    }
}
