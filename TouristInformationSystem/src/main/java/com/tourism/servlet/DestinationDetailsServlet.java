package com.tourism.servlet;

import com.tourism.model.Destination;
import com.tourism.util.XMLDataReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Controller servlet for viewing individual destination details.
 * Validates destination ID and retrieves full travel insights, attractions, and travel tips.
 */
@WebServlet(name = "DestinationDetailsServlet", urlPatterns = {"/destination-details"})
public class DestinationDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        // Validate destination ID parameter
        if (id == null || id.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.setAttribute("errorTitle", "Missing Destination ID");
            request.setAttribute("errorMessage", "No destination was specified in your request. Please select a valid destination from the destinations directory.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        String cleanId = id.trim();
        Destination destination = XMLDataReader.getDestinationById(cleanId);

        // Handle destination not found
        if (destination == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            request.setAttribute("errorTitle", "Destination Not Found");
            request.setAttribute("errorMessage", "We couldn't find a destination with the ID '" + cleanId + "'. It may have been relocated or removed.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // Fetch related destinations in the same category or state (excluding current)
        List<Destination> relatedDestinations = new ArrayList<>();
        for (Destination d : XMLDataReader.getAllDestinations()) {
            if (!d.getId().equalsIgnoreCase(destination.getId())) {
                boolean sameCategory = d.getCategory() != null && d.getCategory().equalsIgnoreCase(destination.getCategory());
                boolean sameState = d.getState() != null && d.getState().equalsIgnoreCase(destination.getState());
                if (sameCategory || sameState) {
                    relatedDestinations.add(d);
                    if (relatedDestinations.size() >= 3) {
                        break;
                    }
                }
            }
        }

        // If not enough related destinations were found, add others up to 3
        if (relatedDestinations.size() < 3) {
            for (Destination d : XMLDataReader.getAllDestinations()) {
                if (!d.getId().equalsIgnoreCase(destination.getId()) && !relatedDestinations.contains(d)) {
                    relatedDestinations.add(d);
                    if (relatedDestinations.size() >= 3) {
                        break;
                    }
                }
            }
        }

        // Set request attributes
        request.setAttribute("destination", destination);
        request.setAttribute("relatedDestinations", relatedDestinations);
        request.setAttribute("activePage", "destinations");

        // Forward to details view
        request.getRequestDispatcher("/destination-details.jsp").forward(request, response);
    }
}
