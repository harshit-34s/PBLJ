<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="${destination.name} | Tourist Information System" />
<jsp:include page="/common/header.jsp" />

<!-- Details Hero Banner -->
<div class="details-hero">
    <img src="<c:out value='${destination.imagePath}' />"
         alt="<c:out value='${destination.name}' />"
         class="details-hero-img"
         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/fallback.svg';">

    <div class="details-hero-overlay">
        <div class="container">
            <div class="details-header-content">
                <div class="details-badge-row">
                    <span class="badge-tag"><c:out value="${destination.category}" /></span>
                    <span class="badge-location">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                            <circle cx="12" cy="10" r="3"></circle>
                        </svg>
                        <c:out value="${destination.location}" />
                    </span>
                    <c:if test="${destination.featured}">
                        <span style="background-color: var(--color-accent-warm); color: #ffffff; padding: 0.3rem 0.75rem; border-radius: var(--radius-full); font-size: 0.75rem; font-weight: 700; text-transform: uppercase;">
                            Spotlight
                        </span>
                    </c:if>
                </div>
                <h1 class="details-main-title"><c:out value="${destination.name}" /></h1>
                <p style="font-size: 1.15rem; color: #e2e8f0; max-width: 800px; line-height: 1.6;">
                    <c:out value="${destination.shortDescription}" />
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Back Navigation Bar -->
<div style="background-color: #ffffff; border-bottom: 1px solid var(--color-border); padding: 0.85rem 0;">
    <div class="container" style="display: flex; align-items: center; justify-content: space-between;">
        <a href="${pageContext.request.contextPath}/destinations" style="display: inline-flex; align-items: center; gap: 0.4rem; font-weight: 600; color: var(--color-teal);">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <line x1="19" y1="12" x2="5" y2="12"></line>
                <polyline points="12 19 5 12 12 5"></polyline>
            </svg>
            Back to All Destinations
        </a>
        <div style="font-size: 0.85rem; color: var(--color-text-muted);">
            Directory &gt; <c:out value="${destination.category}" /> &gt; <strong><c:out value="${destination.name}" /></strong>
        </div>
    </div>
</div>

<!-- Main Details Layout Grid -->
<div class="container">
    <div class="details-grid">

        <!-- Left Column: In-depth Content -->
        <div class="details-article">
            <!-- Full Description -->
            <section style="margin-bottom: 2.75rem;">
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="16" x2="12" y2="12"></line>
                        <line x1="12" y1="8" x2="12.01" y2="8"></line>
                    </svg>
                    About <c:out value="${destination.name}" />
                </h2>
                <p class="details-paragraph">
                    <c:out value="${destination.description}" />
                </p>
            </section>

            <!-- Major Attractions -->
            <section style="margin-bottom: 2.75rem;">
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                    </svg>
                    Major Attractions &amp; Highlights
                </h2>

                <c:choose>
                    <c:when test="${not empty destination.attractions}">
                        <div class="attractions-grid">
                            <c:forEach items="${destination.attractions}" var="attraction" varStatus="status">
                                <div class="attraction-item">
                                    <div class="attraction-icon">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                            <polyline points="20 6 9 17 4 12"></polyline>
                                        </svg>
                                    </div>
                                    <div class="attraction-text">
                                        <c:out value="${attraction}" />
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p style="color: var(--color-text-muted);">Attractions information is currently being updated for this destination.</p>
                    </c:otherwise>
                </c:choose>
            </section>

            <!-- Practical Travel Tips -->
            <section>
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                    Destination-Specific Travel Tips
                </h2>

                <div class="tips-container">
                    <c:choose>
                        <c:when test="${not empty destination.travelTips}">
                            <ul class="tips-list">
                                <c:forEach items="${destination.travelTips}" var="tip" varStatus="loop">
                                    <li class="tip-item">
                                        <span class="tip-bullet"><c:out value="${loop.count}" /></span>
                                        <span><c:out value="${tip}" /></span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <p style="color: var(--color-text-muted);">Always carry valid identification documents and local currency while touring.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>
        </div>

        <!-- Right Column: Quick Facts & Related Destinations -->
        <aside class="details-sidebar">
            <div class="quick-facts-card">
                <h3 class="quick-facts-title">Trip Essentials</h3>
                <div class="facts-list">
                    <!-- Location -->
                    <div class="fact-item">
                        <div class="fact-icon-wrap">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                        </div>
                        <div class="fact-content">
                            <span class="fact-label">Location</span>
                            <span class="fact-val"><c:out value="${destination.location}" /></span>
                        </div>
                    </div>

                    <!-- Best Time to Visit -->
                    <div class="fact-item">
                        <div class="fact-icon-wrap">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <polyline points="12 6 12 12 16 14"></polyline>
                            </svg>
                        </div>
                        <div class="fact-content">
                            <span class="fact-label">Best Time To Visit</span>
                            <span class="fact-val"><c:out value="${destination.bestTimeToVisit}" /></span>
                        </div>
                    </div>

                    <!-- Estimated Budget in INR -->
                    <div class="fact-item">
                        <div class="fact-icon-wrap">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                                <line x1="2" y1="10" x2="22" y2="10"></line>
                            </svg>
                        </div>
                        <div class="fact-content">
                            <span class="fact-label">Est. Budget Per Person</span>
                            <span class="fact-val" style="color: var(--color-accent-amber); font-size: 1.05rem;">
                                <c:out value="${destination.estimatedBudget}" />
                            </span>
                        </div>
                    </div>

                    <!-- Recommended Duration -->
                    <div class="fact-item">
                        <div class="fact-icon-wrap">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </div>
                        <div class="fact-content">
                            <span class="fact-label">Recommended Duration</span>
                            <span class="fact-val"><c:out value="${destination.recommendedDuration}" /></span>
                        </div>
                    </div>

                    <!-- Travel Theme -->
                    <div class="fact-item">
                        <div class="fact-icon-wrap">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1z"></path>
                                <line x1="4" y1="22" x2="4" y2="15"></line>
                            </svg>
                        </div>
                        <div class="fact-content">
                            <span class="fact-label">Category Theme</span>
                            <span class="fact-val"><c:out value="${destination.category}" /></span>
                        </div>
                    </div>
                </div>

                <div style="margin-top: 1.75rem; padding-top: 1.25rem; border-top: 1px solid var(--color-border);">
                    <a href="${pageContext.request.contextPath}/destinations?category=${destination.category}" class="btn btn-outline" style="width: 100%;">
                        More ${destination.category} Places
                    </a>
                </div>
            </div>

            <!-- Related Destinations -->
            <c:if test="${not empty relatedDestinations}">
                <div style="background: #ffffff; border-radius: var(--radius-lg); padding: 1.5rem; border: 1px solid var(--color-border); box-shadow: var(--shadow-sm);">
                    <h4 style="font-size: 1.1rem; font-weight: 700; color: var(--color-primary); margin-bottom: 1rem;">
                        You Might Also Like
                    </h4>
                    <div style="display: flex; flex-direction: column; gap: 1rem;">
                        <c:forEach items="${relatedDestinations}" var="rel">
                            <a href="${pageContext.request.contextPath}/destination-details?id=${rel.id}" style="display: flex; gap: 0.85rem; text-decoration: none; align-items: center; padding: 0.5rem; border-radius: var(--radius-md); transition: background-color 0.2s;" onmouseover="this.style.backgroundColor='var(--color-bg-main)'" onmouseout="this.style.backgroundColor='transparent'">
                                <img src="<c:out value='${rel.imagePath}' />"
                                     alt="<c:out value='${rel.name}' />"
                                     style="width: 60px; height: 60px; object-fit: cover; border-radius: var(--radius-md); flex-shrink: 0;"
                                     onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/fallback.svg';">
                                <div>
                                    <h5 style="color: var(--color-primary); font-size: 0.95rem; font-weight: 700; margin-bottom: 0.2rem;">
                                        <c:out value="${rel.name}" />
                                    </h5>
                                    <span style="font-size: 0.78rem; color: var(--color-teal); font-weight: 600;">
                                        <c:out value="${rel.location}" />
                                    </span>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </aside>

    </div>
</div>

<jsp:include page="/common/footer.jsp" />
