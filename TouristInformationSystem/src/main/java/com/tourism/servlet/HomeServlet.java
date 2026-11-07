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
 * Controller servlet for the Home page.
 * Loads featured destinations, category lists, and summary statistics from the XML data store.
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home", "/index"})
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve featured destinations for the hero showcase
        List<Destination> featuredList = XMLDataReader.getFeaturedDestinations();
        List<String> categories = XMLDataReader.getAllCategories();
        List<String> states = XMLDataReader.getAllStates();
        int totalDestinations = XMLDataReader.getAllDestinations().size();

        // Bind attributes to request scope for JSP rendering via EL
        request.setAttribute("featuredDestinations", featuredList);
        request.setAttribute("categories", categories);
        request.setAttribute("states", states);
        request.setAttribute("totalDestinations", totalDestinations);
        request.setAttribute("activePage", "home");

        // Forward to the home JSP view
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
