<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="Notice | Tourist Information System" />
<jsp:include page="/common/header.jsp" />

<section class="error-section">
    <div class="container">
        <div class="error-card">
            <!-- Error Code or Status -->
            <c:choose>
                <c:when test="${not empty pageContext.errorData.statusCode}">
                    <span class="error-code-badge">HTTP Error ${pageContext.errorData.statusCode}</span>
                </c:when>
                <c:otherwise>
                    <span class="error-code-badge">Notice</span>
                </c:otherwise>
            </c:choose>

            <h1 class="error-title">
                <c:choose>
                    <c:when test="${not empty errorTitle}">
                        <c:out value="${errorTitle}" />
                    </c:when>
                    <c:when test="${pageContext.errorData.statusCode == 404}">
                        Page Not Found
                    </c:when>
                    <c:otherwise>
                        Something Went Wrong
                    </c:otherwise>
                </c:choose>
            </h1>

            <p class="error-message">
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        <c:out value="${errorMessage}" />
                    </c:when>
                    <c:when test="${pageContext.errorData.statusCode == 404}">
                        The travel guide or destination you requested could not be located. It might have been moved, renamed, or is temporarily unavailable.
                    </c:when>
                    <c:otherwise>
                        An unexpected error occurred while processing your travel request. Please try again or return to our destination catalog.
                    </c:otherwise>
                </c:choose>
            </p>

            <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                <a href="${pageContext.request.contextPath}/destinations" class="btn btn-teal">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76" fill="currentColor"></polygon>
                    </svg>
                    Explore Destinations
                </a>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-outline">
                    Return to Home
                </a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/common/footer.jsp" />
