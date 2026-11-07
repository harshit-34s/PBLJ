<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="pageTitle" value="Home | Tourist Information System - Incredible India" />
<jsp:include page="/common/header.jsp" />

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-badge">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
            </svg>
            Curated Indian Travel Guide
        </div>
        <h1 class="hero-title">
            Discover the Timeless Wonder of <span>Incredible India</span>
        </h1>
        <p class="hero-subtitle">
            From the eternal marble majesty of the Taj Mahal to serene Kerala backwaters and misty Himalayan hill stations, plan your perfect journey with accurate budgets, attractions, and practical tips.
        </p>
        <div class="hero-actions">
            <a href="${pageContext.request.contextPath}/destinations" class="btn btn-primary">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10"></circle>
                    <polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76" fill="currentColor"></polygon>
                </svg>
                Explore All Destinations
            </a>
            <a href="${pageContext.request.contextPath}/travel-tips" class="btn btn-secondary">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <line x1="16" y1="13" x2="8" y2="13"></line>
                    <line x1="16" y1="17" x2="8" y2="17"></line>
                </svg>
                Essential Travel Tips
            </a>
        </div>
    </div>
</section>

<!-- Stats Strip -->
<div class="container">
    <div class="stats-strip">
        <div class="stats-grid">
            <div class="stat-item">
                <span class="stat-number"><c:out value="${totalDestinations > 0 ? totalDestinations : '8+'}" /></span>
                <span class="stat-label">Iconic Destinations</span>
            </div>
            <div class="stat-item">
                <span class="stat-number"><c:out value="${fn:length(categories)}" /></span>
                <span class="stat-label">Travel Themes</span>
            </div>
            <div class="stat-item">
                <span class="stat-number"><c:out value="${fn:length(states)}" /></span>
                <span class="stat-label">States Covered</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">100%</span>
                <span class="stat-label">XML-Driven Data</span>
            </div>
        </div>
    </div>
</div>

<!-- Featured Destinations Section -->
<section style="padding: 4.5rem 0 3rem;">
    <div class="container">
        <div class="section-header">
            <span class="section-tag">Handpicked For You</span>
            <h2 class="section-title">Featured Destinations</h2>
            <p class="section-desc">
                Explore our spotlight collection of the most sought-after tourist attractions across India.
            </p>
        </div>

        <div class="destinations-grid">
            <c:forEach items="${featuredDestinations}" var="dest">
                <article class="destination-card">
                    <div class="card-image-wrap">
                        <img src="<c:out value='${dest.imagePath}'/>"
                             alt="<c:out value='${dest.name}'/>"
                             class="card-img"
                             loading="lazy"
                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/fallback.svg';">
                        <span class="card-badge-category"><c:out value="${dest.category}" /></span>
                        <span class="card-badge-featured">Featured</span>
                    </div>

                    <div class="card-body">
                        <div class="card-location">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                            <c:out value="${dest.location}" />
                        </div>
                        <h3 class="card-title">
                            <a href="${pageContext.request.contextPath}/destination-details?id=${dest.id}">
                                <c:out value="${dest.name}" />
                            </a>
                        </h3>
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
                                View Full Details
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

        <div style="text-align: center; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/destinations" class="btn btn-outline" style="padding: 0.85rem 2.25rem;">
                Browse All Destinations &rarr;
            </a>
        </div>
    </div>
</section>

<!-- Travel By Category Quick Links -->
<section style="padding: 3.5rem 0 5rem; background-color: #ffffff; border-top: 1px solid var(--color-border);">
    <div class="container">
        <div class="section-header">
            <span class="section-tag">Diverse Experiences</span>
            <h2 class="section-title">Explore by Travel Theme</h2>
            <p class="section-desc">
                Whether you crave mountain adventures, tranquil water bodies, or historical monuments, we have you covered.
            </p>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem;">
            <a href="${pageContext.request.contextPath}/destinations?category=Heritage" style="text-decoration: none;">
                <div style="background: var(--color-bg-main); border: 1px solid var(--color-border); border-radius: var(--radius-lg); padding: 1.75rem; text-align: center; transition: all 0.2s;" onmouseover="this.style.borderColor='var(--color-teal)'; this.style.transform='translateY(-4px)'" onmouseout="this.style.borderColor='var(--color-border)'; this.style.transform='none'">
                    <div style="width: 54px; height: 54px; margin: 0 auto 1rem; background: #e0f2fe; color: #0284c7; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;">
                        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18M5 21V7l7-4 7 4v14M9 21v-6a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v6"/></svg>
                    </div>
                    <h3 style="color: var(--color-primary); font-size: 1.15rem; font-weight: 700; margin-bottom: 0.35rem;">Heritage</h3>
                    <p style="color: var(--color-text-muted); font-size: 0.85rem;">Palaces, forts &amp; UNESCO monuments</p>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/destinations?category=Hill+Station" style="text-decoration: none;">
                <div style="background: var(--color-bg-main); border: 1px solid var(--color-border); border-radius: var(--radius-lg); padding: 1.75rem; text-align: center; transition: all 0.2s;" onmouseover="this.style.borderColor='var(--color-teal)'; this.style.transform='translateY(-4px)'" onmouseout="this.style.borderColor='var(--color-border)'; this.style.transform='none'">
                    <div style="width: 54px; height: 54px; margin: 0 auto 1rem; background: #dcfce7; color: #16a34a; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;">
                        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m8 3 4 8 5-5 5 15H2L8 3z"/></svg>
                    </div>
                    <h3 style="color: var(--color-primary); font-size: 1.15rem; font-weight: 700; margin-bottom: 0.35rem;">Hill Station</h3>
                    <p style="color: var(--color-text-muted); font-size: 0.85rem;">Himalayan valleys &amp; tea gardens</p>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/destinations?category=Beach" style="text-decoration: none;">
                <div style="background: var(--color-bg-main); border: 1px solid var(--color-border); border-radius: var(--radius-lg); padding: 1.75rem; text-align: center; transition: all 0.2s;" onmouseover="this.style.borderColor='var(--color-teal)'; this.style.transform='translateY(-4px)'" onmouseout="this.style.borderColor='var(--color-border)'; this.style.transform='none'">
                    <div style="width: 54px; height: 54px; margin: 0 auto 1rem; background: #fef3c7; color: #d97706; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;">
                        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="5"/><path d="M12 1v2M12 21v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M1 12h2M21 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/></svg>
                    </div>
                    <h3 style="color: var(--color-primary); font-size: 1.15rem; font-weight: 700; margin-bottom: 0.35rem;">Beach</h3>
                    <p style="color: var(--color-text-muted); font-size: 0.85rem;">Golden sands, sun &amp; coastal cuisine</p>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/destinations?category=Spiritual" style="text-decoration: none;">
                <div style="background: var(--color-bg-main); border: 1px solid var(--color-border); border-radius: var(--radius-lg); padding: 1.75rem; text-align: center; transition: all 0.2s;" onmouseover="this.style.borderColor='var(--color-teal)'; this.style.transform='translateY(-4px)'" onmouseout="this.style.borderColor='var(--color-border)'; this.style.transform='none'">
                    <div style="width: 54px; height: 54px; margin: 0 auto 1rem; background: #fee2e2; color: #dc2626; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;">
                        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2v20M2 12h20"/><circle cx="12" cy="12" r="8"/></svg>
                    </div>
                    <h3 style="color: var(--color-primary); font-size: 1.15rem; font-weight: 700; margin-bottom: 0.35rem;">Spiritual</h3>
                    <p style="color: var(--color-text-muted); font-size: 0.85rem;">Sacred ghats, gurdwaras &amp; peace</p>
                </div>
            </a>

            <a href="${pageContext.request.contextPath}/destinations?category=Nature" style="text-decoration: none;">
                <div style="background: var(--color-bg-main); border: 1px solid var(--color-border); border-radius: var(--radius-lg); padding: 1.75rem; text-align: center; transition: all 0.2s;" onmouseover="this.style.borderColor='var(--color-teal)'; this.style.transform='translateY(-4px)'" onmouseout="this.style.borderColor='var(--color-border)'; this.style.transform='none'">
                    <div style="width: 54px; height: 54px; margin: 0 auto 1rem; background: #ccfbf1; color: #0d9488; border-radius: var(--radius-md); display: flex; align-items: center; justify-content: center;">
                        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 12h20M2 16h20M2 8h20M7 4c2.5 0 3 4 5 4s2.5-4 5-4"/></svg>
                    </div>
                    <h3 style="color: var(--color-primary); font-size: 1.15rem; font-weight: 700; margin-bottom: 0.35rem;">Nature</h3>
                    <p style="color: var(--color-text-muted); font-size: 0.85rem;">Backwaters, lagoons &amp; wildlife</p>
                </div>
            </a>
        </div>
    </div>
</section>

<jsp:include page="/common/footer.jsp" />
