<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    </main>

    <!-- Global Footer -->
    <footer class="site-footer">
        <div class="container">
            <div class="footer-grid">
                <!-- Col 1: Brand & Purpose -->
                <div>
                    <h3 class="footer-col-title">Tourist Information System</h3>
                    <p class="footer-desc">
                        A modern, responsive Java web application designed to help travelers discover iconic Indian heritage, hill stations, serene backwaters, spiritual landmarks, and golden beaches.
                    </p>
                    <div class="footer-tech-stack">
                        <span class="tech-badge">Java 17</span>
                        <span class="tech-badge">Jakarta Servlet 6.0</span>
                        <span class="tech-badge">JSP 3.1</span>
                        <span class="tech-badge">XML Data Store</span>
                        <span class="tech-badge">Tomcat 10.1+</span>
                    </div>
                </div>

                <!-- Col 2: Quick Links -->
                <div>
                    <h3 class="footer-col-title">Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/home" class="footer-link">Home Overview</a></li>
                        <li><a href="${pageContext.request.contextPath}/destinations" class="footer-link">All Destinations</a></li>
                        <li><a href="${pageContext.request.contextPath}/travel-tips" class="footer-link">Curated Travel Tips</a></li>
                        <li><a href="${pageContext.request.contextPath}/about" class="footer-link">About &amp; Architecture</a></li>
                    </ul>
                </div>

                <!-- Col 3: Popular Highlights -->
                <div>
                    <h3 class="footer-col-title">Top Destinations</h3>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/destination-details?id=taj-mahal" class="footer-link">Taj Mahal, Agra</a></li>
                        <li><a href="${pageContext.request.contextPath}/destination-details?id=manali" class="footer-link">Manali, Himachal</a></li>
                        <li><a href="${pageContext.request.contextPath}/destination-details?id=kerala-backwaters" class="footer-link">Kerala Backwaters</a></li>
                        <li><a href="${pageContext.request.contextPath}/destination-details?id=jaipur" class="footer-link">Jaipur, Rajasthan</a></li>
                        <li><a href="${pageContext.request.contextPath}/destination-details?id=golden-temple" class="footer-link">Golden Temple, Amritsar</a></li>
                    </ul>
                </div>

                <!-- Col 4: Travel Advisory -->
                <div>
                    <h3 class="footer-col-title">Travel Assistance</h3>
                    <p class="footer-desc">
                        Emergency Tourist Helpline (India): <strong>1363</strong> or <strong>1800-11-1363</strong>. Always follow verified safety protocols and check local seasonal weather updates.
                    </p>
                    <p class="footer-desc">
                        Official Tourism Portal: <a href="https://www.incredibleindia.org" target="_blank" rel="noopener noreferrer" style="color: var(--color-teal-bright);">incredibleindia.org</a>
                    </p>
                </div>
            </div>

            <!-- Bottom Copyright & Back to Top -->
            <div class="footer-bottom">
                <p>&copy; 2026 Tourist Information System. Academic &amp; Educational Project.</p>
                <div>
                    <a href="#top" id="scrollTopBtn" style="color: var(--color-teal-bright); font-weight: 600; display: inline-flex; align-items: center; gap: 0.35rem;">
                        Back to Top &uarr;
                    </a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Client-side Scripts -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
