package com.tourism.servlet;

import com.tourism.util.XMLDataReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Controller servlet for the About page.
 * Details the system architecture, MVC design pattern, XML data model, and project objectives.
 */
@WebServlet(name = "AboutServlet", urlPatterns = {"/about"})
public class AboutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("totalDestinations", XMLDataReader.getAllDestinations().size());
        request.setAttribute("totalCategories", XMLDataReader.getAllCategories().size());
        request.setAttribute("totalStates", XMLDataReader.getAllStates().size());
        request.setAttribute("activePage", "about");

        request.getRequestDispatcher("/about.jsp").forward(request, response);
    }
}
