package com.tourism.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Controller servlet for the Travel Tips guide page.
 * Provides curated packing advice, safety guidance, budget suggestions, and eco-tourism principles.
 */
@WebServlet(name = "TravelTipsServlet", urlPatterns = {"/travel-tips"})
public class TravelTipsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("activePage", "travel-tips");
        request.getRequestDispatcher("/travel-tips.jsp").forward(request, response);
    }
}
