<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="Explore Destinations | Tourist Information System" />
<jsp:include page="/common/header.jsp" />

<!-- Page Title Header -->
<div style="background-color: var(--color-primary); color: #ffffff; padding: 2.75rem 0 3.25rem;">
    <div class="container">
        <span class="hero-badge" style="background: rgba(255,255,255,0.12); margin-bottom: 0.75rem;">
            Destination Directory
        </span>
        <h1 style="font-size: 2.5rem; font-weight: 800; margin-bottom: 0.5rem; letter-spacing: -0.02em;">
            Explore Tourist Destinations
        </h1>
        <p style="color: #cbd5e1; font-size: 1.05rem; max-width: 650px;">
            Search and filter by category and state to plan your ideal travel itinerary across India.
        </p>
    </div>
</div>

<div class="container" style="padding-top: 2rem; padding-bottom: 4rem;">

    <!-- Search & Unified Filter Card -->
    <div class="search-filter-card">
        <form action="${pageContext.request.contextPath}/destinations" method="GET" class="search-filter-form" id="searchFilterForm">
            <!-- Search Keyword Field -->
            <div class="form-group">
                <label for="searchInput" class="form-label">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    Search Query
                </label>
                <input type="text"
                       id="searchInput"
                       name="q"
                       value="<c:out value='${searchQuery}' />"
                       placeholder="Search by destination, city, or state..."
                       class="form-control"
                       autocomplete="off" />
            </div>

            <!-- Category Filter Dropdown -->
            <div class="form-group">
                <label for="categorySelect" class="form-label">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 6h16M7 12h10M10 18h4"></path>
                    </svg>
                    Category
                </label>
                <select id="categorySelect" name="category" class="form-control">
                    <option value="all" ${empty selectedCategory || selectedCategory eq 'all' ? 'selected' : ''}>All Categories</option>
                    <c:forEach items="${categories}" var="cat">
                        <option value="<c:out value='${cat}' />" ${selectedCategory eq cat ? 'selected' : ''}>
                            <c:out value="${cat}" />
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- State Filter Dropdown -->
            <div class="form-group">
                <label for="stateSelect" class="form-label">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon>
                        <line x1="8" y1="2" x2="8" y2="18"></line>
                        <line x1="16" y1="6" x2="16" y2="22"></line>
                    </svg>
                    State
                </label>
                <select id="stateSelect" name="state" class="form-control">
                    <option value="all" ${empty selectedState || selectedState eq 'all' ? 'selected' : ''}>All States</option>
                    <c:forEach items="${states}" var="st">
                        <option value="<c:out value='${st}' />" ${selectedState eq st ? 'selected' : ''}>
                            <c:out value="${st}" />
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- Action Buttons -->
            <div>
                <button type="submit" class="btn btn-teal btn-filter">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                    Search
                </button>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/destinations" class="btn btn-outline btn-filter" title="Reset all search queries and filters">
                    Reset
                </a>
            </div>
        </form>

        <!-- Active Filter Indicator & Count Bar -->
        <div class="filter-results-info">
            <div>
                Showing <strong><c:out value="${totalCount}" /></strong> destination<c:out value="${totalCount != 1 ? 's' : ''}" />
            </div>

            <div class="active-filter-chips">
                <c:if test="${not empty searchQuery}">
                    <span class="filter-chip">
                        Query: "<c:out value="${searchQuery}" />"
                    </span>
                </c:if>
                <c:if test="${not empty selectedCategory && selectedCategory ne 'all'}">
                    <span class="filter-chip">
                        Category: <c:out value="${selectedCategory}" />
                    </span>
                </c:if>
                <c:if test="${not empty selectedState && selectedState ne 'all'}">
                    <span class="filter-chip">
                        State: <c:out value="${selectedState}" />
                    </span>
                </c:if>
                <c:if test="${not empty searchQuery || (not empty selectedCategory && selectedCategory ne 'all') || (not empty selectedState && selectedState ne 'all')}">
                    <a href="${pageContext.request.contextPath}/destinations" style="font-size: 0.8rem; color: var(--color-accent-amber); font-weight: 600; text-decoration: underline;">
                        Clear All
                    </a>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Destinations Grid or Empty State -->
    <c:choose>
        <c:when test="${not empty destinations}">
            <div class="destinations-grid">
                <c:forEach items="${destinations}" var="dest">
                    <article class="destination-card">
                        <div class="card-image-wrap">
                            <img src="<c:out value='${dest.imagePath}' />"
                                 alt="<c:out value='${dest.name}' />"
                                 class="card-img"
                                 loading="lazy"
                                 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/fallback.svg';">
                            <span class="card-badge-category"><c:out value="${dest.category}" /></span>
                            <c:if test="${dest.featured}">
                                <span class="card-badge-featured">Featured</span>
                            </c:if>
                        </div>

                        <div class="card-body">
                            <div class="card-location">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                    <circle cx="12" cy="10" r="3"></circle>
                                </svg>
                                <c:out value="${dest.location}" />
                            </div>

                            <h2 class="card-title">
                                <a href="${pageContext.request.contextPath}/destination-details?id=${dest.id}">
                                    <c:out value="${dest.name}" />
                                </a>
                            </h2>

                            <p class="card-description">
                                <c:out value="${dest.shortDescription}" />
                            </p>

                            <div class="card-meta-strip">
                                <div class="card-budget">
                                    <span class="card-budget-label">Est. Budget</span>
                                    <span class="card-budget-val"><c:out value="${dest.estimatedBudget}" /></span>
                                </div>
                                <div class="card-duration">
                                    <span class="card-duration-label">Duration</span>
                                    <span class="card-duration-val"><c:out value="${dest.recommendedDuration}" /></span>
                                </div>
                            </div>

                            <div class="card-footer">
                                <a href="${pageContext.request.contextPath}/destination-details?id=${dest.id}" class="btn btn-teal">
                                    Explore Destination
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                        <polyline points="12 5 19 12 12 19"></polyline>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </c:when>

        <c:otherwise>
            <!-- Friendly Empty State -->
            <div class="empty-state">
                <div class="empty-state-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        <line x1="8" y1="11" x2="14" y2="11"></line>
                    </svg>
                </div>
                <h2 class="empty-state-title">No Destinations Found</h2>
                <p class="empty-state-text">
                    We couldn't find any destinations matching your current search or filter combination. Try adjusting the keywords or resetting the filters.
                </p>
                <a href="${pageContext.request.contextPath}/destinations" class="btn btn-teal">
                    Reset All Filters
                </a>
            </div>
        </c:otherwise>
    </c:choose>

</div>

<jsp:include page="/common/footer.jsp" />
