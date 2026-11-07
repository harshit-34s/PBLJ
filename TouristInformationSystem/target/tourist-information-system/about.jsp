<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="About Project | Tourist Information System" />
<jsp:include page="/common/header.jsp" />

<!-- About Hero Section -->
<section class="about-hero">
    <div class="container">
        <span class="hero-badge" style="background: rgba(255,255,255,0.12); margin-bottom: 0.75rem;">
            Academic Web Engineering Project
        </span>
        <h1 style="font-size: 2.75rem; font-weight: 800; margin-bottom: 0.75rem; letter-spacing: -0.02em;">
            About Tourist Information System
        </h1>
        <p style="color: #cbd5e1; font-size: 1.15rem; max-width: 720px; margin: 0 auto; line-height: 1.7;">
            A complete Model-View-Controller (MVC) Java Web Application built with Java 17, Jakarta Servlets 6.0, JSP 3.1, JSTL 3.0, and secure XML data storage for Apache Tomcat 10.1+.
        </p>
    </div>
</section>

<div class="container">
    <div class="about-grid">

        <!-- Main Column -->
        <div>
            <!-- Section 1: Objective & Purpose -->
            <div class="architecture-card">
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polygon points="12 6 12 12 16 14"></polygon>
                    </svg>
                    Project Objective &amp; Vision
                </h2>
                <p class="details-paragraph">
                    The <strong>Tourist Information System</strong> is designed as a centralized, interactive digital guide for tourists wanting to explore renowned travel destinations across India. The application aims to solve the problem of fragmented and overwhelming travel data by providing structured, reliable, and verified information including <strong>major attractions, best visiting seasons, estimated travel budgets in INR, recommended durations, and safety advice</strong>.
                </p>
                <p class="details-paragraph">
                    Architecturally, the project demonstrates how to build an enterprise-standard web application using pure core Java web standards (Servlets and JSP) adhering to the <strong>Model-View-Controller (MVC)</strong> paradigm without requiring external database servers or complex frameworks like Spring Boot.
                </p>
            </div>

            <!-- Section 2: MVC Architecture Explained -->
            <div class="architecture-card">
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
                        <polyline points="2 17 12 22 22 17"></polyline>
                        <polyline points="2 12 12 17 22 12"></polyline>
                    </svg>
                    MVC Architecture &amp; Request Lifecycle
                </h2>

                <div class="mvc-flow-box">
                    <div class="mvc-steps">
                        <div class="mvc-step">
                            <span class="mvc-step-badge">1</span>
                            <div class="mvc-step-text">
                                <strong>Client Request (Browser):</strong> The user initiates an HTTP GET request (e.g. <code>/destinations?category=Heritage&amp;q=Agra</code>).
                            </div>
                        </div>
                        <div class="mvc-step">
                            <span class="mvc-step-badge">2</span>
                            <div class="mvc-step-text">
                                <strong>Controller (Jakarta Servlets):</strong> The request is routed to <code>DestinationServlet</code> via <code>web.xml</code> and annotations. The servlet extracts, sanitizes, and validates input parameters.
                            </div>
                        </div>
                        <div class="mvc-step">
                            <span class="mvc-step-badge">3</span>
                            <div class="mvc-step-text">
                                <strong>Model &amp; Utility Layer:</strong> The controller delegates querying to <code>XMLDataReader</code>, which securely parses <code>destinations.xml</code> and populates <code>Destination</code> POJO objects.
                            </div>
                        </div>
                        <div class="mvc-step">
                            <span class="mvc-step-badge">4</span>
                            <div class="mvc-step-text">
                                <strong>Request Attributes Binding:</strong> The controller attaches the filtered destination models and category lists to the <code>HttpServletRequest</code> using <code>request.setAttribute()</code>.
                            </div>
                        </div>
                        <div class="mvc-step">
                            <span class="mvc-step-badge">5</span>
                            <div class="mvc-step-text">
                                <strong>View Rendering (JSP &amp; JSTL):</strong> The servlet forwards the request to <code>destinations.jsp</code> using <code>RequestDispatcher.forward()</code>. Dynamic HTML is generated using standard JSP EL and JSTL tags—no scriptlets are used.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section 3: College Viva & Exam Defense Guide -->
            <div class="architecture-card">
                <h2 class="details-section-heading">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 20h9"></path>
                        <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                    </svg>
                    Viva Q&amp;A Cheat Sheet
                </h2>

                <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                    <div style="background: var(--color-bg-main); padding: 1.2rem; border-radius: var(--radius-md); border-left: 4px solid var(--color-teal);">
                        <h3 style="font-size: 1rem; color: var(--color-primary); font-weight: 700; margin-bottom: 0.4rem;">
                            Q1: Why use XML instead of a relational database like MySQL?
                        </h3>
                        <p style="font-size: 0.92rem; color: var(--color-text-main);">
                            <strong>Answer:</strong> XML provides a self-contained, human-readable, and zero-configuration data store. For informational catalogs that do not require high-frequency transactional writes, XML allows complete application portability without database installation, connection pools, or schema migrations.
                        </p>
                    </div>

                    <div style="background: var(--color-bg-main); padding: 1.2rem; border-radius: var(--radius-md); border-left: 4px solid var(--color-accent-warm);">
                        <h3 style="font-size: 1rem; color: var(--color-primary); font-weight: 700; margin-bottom: 0.4rem;">
                            Q2: How does the application prevent XML External Entity (XXE) attacks?
                        </h3>
                        <p style="font-size: 0.92rem; color: var(--color-text-main);">
                            <strong>Answer:</strong> In <code>XMLDataReader.java</code>, the <code>DocumentBuilderFactory</code> explicitly disables external DTD declarations via <code>http://apache.org/xml/features/disallow-doctype-decl</code>, turns off general/parameter entities, and sets entity expansion to false. This prevents malicious XML payloads from exfiltrating server files.
                        </p>
                    </div>

                    <div style="background: var(--color-bg-main); padding: 1.2rem; border-radius: var(--radius-md); border-left: 4px solid var(--color-teal);">
                        <h3 style="font-size: 1rem; color: var(--color-primary); font-weight: 700; margin-bottom: 0.4rem;">
                            Q3: Why are Jakarta package imports used instead of javax?
                        </h3>
                        <p style="font-size: 0.92rem; color: var(--color-text-main);">
                            <strong>Answer:</strong> With the evolution from Java EE to Jakarta EE (Jakarta EE 9 and 10), Oracle transferred the specification to the Eclipse Foundation, transitioning package namespace from <code>javax.servlet.*</code> to <code>jakarta.servlet.*</code>. Apache Tomcat 10.1 and 11 strictly implement Jakarta EE 10/11 specifications.
                        </p>
                    </div>

                    <div style="background: var(--color-bg-main); padding: 1.2rem; border-radius: var(--radius-md); border-left: 4px solid var(--color-accent-warm);">
                        <h3 style="font-size: 1rem; color: var(--color-primary); font-weight: 700; margin-bottom: 0.4rem;">
                            Q4: Why avoid Java scriptlets in JSP?
                        </h3>
                        <p style="font-size: 0.92rem; color: var(--color-text-main);">
                            <strong>Answer:</strong> Scriptlets (<code>&lt;% ... %&gt;</code>) violate separation of concerns by mixing business logic with presentation. Using JSP Expression Language (<code>\${...}</code>) and JSTL tags ensures clean, maintainable, readable, and XSS-resistant markup.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Sidebar: Technology Specs -->
        <aside>
            <div class="quick-facts-card" style="position: static;">
                <h3 class="quick-facts-title">Technical Stack</h3>

                <table class="tech-spec-table">
                    <tbody>
                        <tr>
                            <th>Platform</th>
                            <td>Java 17 (JDK 25 compatible)</td>
                        </tr>
                        <tr>
                            <th>Web Framework</th>
                            <td>Jakarta Servlet 6.0</td>
                        </tr>
                        <tr>
                            <th>Presentation</th>
                            <td>JSP 3.1 &amp; JSTL 3.0</td>
                        </tr>
                        <tr>
                            <th>Data Storage</th>
                            <td>XML (DOM Parser, XXE Protected)</td>
                        </tr>
                        <tr>
                            <th>Application Server</th>
                            <td>Apache Tomcat 10.1+</td>
                        </tr>
                        <tr>
                            <th>Build Tool</th>
                            <td>Apache Maven (WAR packaging)</td>
                        </tr>
                        <tr>
                            <th>Styling &amp; UX</th>
                            <td>HTML5, CSS3, Vanilla JS</td>
                        </tr>
                        <tr>
                            <th>Design Pattern</th>
                            <td>Model-View-Controller (MVC)</td>
                        </tr>
                    </tbody>
                </table>

                <div style="margin-top: 1.5rem; text-align: center;">
                    <a href="${pageContext.request.contextPath}/destinations" class="btn btn-teal" style="width: 100%;">
                        Explore System in Action
                    </a>
                </div>
            </div>
        </aside>

    </div>
</div>

<jsp:include page="/common/footer.jsp" />
