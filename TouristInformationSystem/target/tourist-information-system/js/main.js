/**
 * Tourist Information System - Client-side JavaScript
 * Vanilla JS providing responsive navigation, fallback image handling,
 * and UI interactions without external dependencies.
 */
document.addEventListener('DOMContentLoaded', function () {

    // 1. Mobile Navigation Menu Toggle
    const navToggle = document.getElementById('mobileNavToggle');
    const navLinks = document.getElementById('navLinks');

    if (navToggle && navLinks) {
        navToggle.addEventListener('click', function () {
            const isExpanded = navLinks.classList.toggle('active');
            navToggle.setAttribute('aria-expanded', isExpanded);
        });

        // Close mobile nav when clicking outside
        document.addEventListener('click', function (e) {
            if (!navToggle.contains(e.target) && !navLinks.contains(e.target) && navLinks.classList.contains('active')) {
                navLinks.classList.remove('active');
                navToggle.setAttribute('aria-expanded', 'false');
            }
        });
    }

    // 2. Global Fallback for Broken or Blocked Remote Images
    const destinationImages = document.querySelectorAll('.card-img, .details-hero-img');
    destinationImages.forEach(function (img) {
        img.addEventListener('error', function () {
            // Check if fallback has already been applied to prevent infinite loops
            if (!this.dataset.fallbackApplied) {
                this.dataset.fallbackApplied = 'true';
                const contextPath = document.body.dataset.contextPath || '';
                this.src = contextPath + '/images/fallback.svg';
                this.alt = 'Destination visual placeholder';
            }
        });
    });

    // 3. Scroll to Top Behavior
    const scrollTopBtn = document.getElementById('scrollTopBtn');
    if (scrollTopBtn) {
        scrollTopBtn.addEventListener('click', function (e) {
            e.preventDefault();
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }

    // 4. Auto-submit filter form on dropdown change (enhancement)
    const categorySelect = document.getElementById('categorySelect');
    const stateSelect = document.getElementById('stateSelect');
    const filterForm = document.getElementById('searchFilterForm');

    if (filterForm) {
        if (categorySelect) {
            categorySelect.addEventListener('change', function () {
                filterForm.submit();
            });
        }
        if (stateSelect) {
            stateSelect.addEventListener('change', function () {
                filterForm.submit();
            });
        }
    }
});
