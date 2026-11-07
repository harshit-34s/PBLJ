<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${not empty pageTitle ? pageTitle : 'Tourist Information System | Incredible India'}"/> </title>
    <!-- Master Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Font Preconnect -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body data-context-path="${pageContext.request.contextPath}">

    <!-- Global Header -->
    <header class="site-header">
        <div class="container nav-container">
            <!-- Brand Logo -->
            <a href="${pageContext.request.contextPath}/home" class="brand-logo" aria-label="Tourist Information System Home">
                <div class="brand-icon">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76" fill="currentColor"></polygon>
                    </svg>
                </div>
                <div class="brand-text">
                    <span class="brand-title">Tourist Information System</span>
                    <span class="brand-subtitle">Explore Incredible India</span>
                </div>
            </a>

            <!-- Navigation Links -->
            <ul class="nav-links" id="navLinks">
                <li>
                    <a href="${pageContext.request.contextPath}/home" class="nav-link ${activePage == 'home' ? 'active' : ''}">Home</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/destinations" class="nav-link ${activePage == 'destinations' ? 'active' : ''}">Destinations</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/travel-tips" class="nav-link ${activePage == 'travel-tips' ? 'active' : ''}">Travel Tips</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/about" class="nav-link ${activePage == 'about' ? 'active' : ''}">About</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/destinations" class="nav-cta">Explore Now</a>
                </li>
            </ul>

            <!-- Mobile Hamburger Toggle -->
            <button class="mobile-nav-toggle" id="mobileNavToggle" aria-label="Toggle navigation menu" aria-expanded="false">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
        </div>
    </header>

    <main class="main-content">
