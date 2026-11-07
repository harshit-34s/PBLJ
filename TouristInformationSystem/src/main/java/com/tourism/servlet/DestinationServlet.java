package com.tourism.servlet;

import com.tourism.model.Destination;
import com.tourism.util.XMLDataReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Controller servlet for destinations catalog, search, and multi-criteria filtering.
 * Processes GET parameters 'q' (search text), 'category', and 'state'.
 */
@WebServlet(name = "DestinationServlet", urlPatterns = {"/destinations"})
public class DestinationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read GET query parameters
        String query = request.getParameter("q");
        String category = request.getParameter("category");
        String state = request.getParameter("state");

        // Clean parameters (normalize empty strings to null or trimmed text)
        String cleanQuery = (query != null) ? query.trim() : "";
        String cleanCategory = (category != null) ? category.trim() : "";
        String cleanState = (state != null) ? state.trim() : "";

        // Execute unified search & filter
        List<Destination> filteredDestinations = XMLDataReader.searchAndFilter(cleanQuery, cleanCategory, cleanState);

        // Fetch master filter lists for dropdown controls
        List<String> allCategories = XMLDataReader.getAllCategories();
        List<String> allStates = XMLDataReader.getAllStates();

        // Pass results and current filter selections back to JSP
        request.setAttribute("destinations", filteredDestinations);
        request.setAttribute("categories", allCategories);
        request.setAttribute("states", allStates);
        request.setAttribute("searchQuery", cleanQuery);
        request.setAttribute("selectedCategory", cleanCategory);
        request.setAttribute("selectedState", cleanState);
        request.setAttribute("totalCount", filteredDestinations.size());
        request.setAttribute("activePage", "destinations");

        // Forward to the destinations list JSP
        request.getRequestDispatcher("/destinations.jsp").forward(request, response);
    }
}
