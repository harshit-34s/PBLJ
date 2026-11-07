<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="pageTitle" value="Essential Travel Tips | Tourist Information System" />
<jsp:include page="/common/header.jsp" />

<!-- Page Header -->
<div style="background-color: var(--color-primary); color: #ffffff; padding: 3rem 0 3.5rem;">
    <div class="container">
        <span class="hero-badge" style="background: rgba(255,255,255,0.12); margin-bottom: 0.75rem;">
            Travel Smart &amp; Safely
        </span>
        <h1 style="font-size: 2.6rem; font-weight: 800; margin-bottom: 0.5rem; letter-spacing: -0.02em;">
            India Travel Advice &amp; Best Practices
        </h1>
        <p style="color: #cbd5e1; font-size: 1.1rem; max-width: 680px;">
            Expert guidance on packing essentials, tourist safety, budget maximization, and eco-friendly tourism across India.
        </p>
    </div>
</div>

<div class="container" style="padding-top: 3rem; padding-bottom: 4rem;">

    <div class="tips-grid">

        <!-- 1. Packing Advice -->
        <div class="tip-category-card">
            <div class="tip-card-header">
                <div class="tip-category-icon icon-packing">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
                        <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
                    </svg>
                </div>
                <div>
                    <span style="font-size: 0.78rem; text-transform: uppercase; font-weight: 700; color: #0284c7; letter-spacing: 0.05em;">Preparation</span>
                    <h2 class="tip-card-title">Packing Advice</h2>
                </div>
            </div>

            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Layered Clothing for Hill Stations:</strong> If visiting places like Manali or Darjeeling, pack thermals, fleece jackets, and windproof outer layers, as temperatures drop sharply after sunset.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Modest Attire for Sacred Sites:</strong> At gurdwaras, temples, and mosques (e.g. Golden Temple, Varanasi Ghats), keep shoulders and knees covered. Carry lightweight scarves or bandanas.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Travel Medical Kit:</strong> Pack electrolyte sachets (ORS), motion sickness pills for winding mountain roads, insect repellent cream, and basic fever/pain relief tablets.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Power &amp; Connectivity:</strong> India uses Type C, D, and M electrical plugs (230V, 50Hz). Keep a universal adapter and a high-capacity power bank handy.
                </div>
            </div>
        </div>

        <!-- 2. Safety Guidance -->
        <div class="tip-category-card">
            <div class="tip-card-header">
                <div class="tip-category-icon icon-safety">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                </div>
                <div>
                    <span style="font-size: 0.78rem; text-transform: uppercase; font-weight: 700; color: #dc2626; letter-spacing: 0.05em;">Security</span>
                    <h2 class="tip-card-title">Safety Guidance</h2>
                </div>
            </div>

            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>National Tourist Helpline:</strong> Dial <strong>1363</strong> (toll-free in 12 languages) or <strong>112</strong> for any emergency assistance across Indian states.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Official Guides &amp; Transport:</strong> Hire Ministry of Tourism-certified guides wearing official photo badges. Use prepaid taxi counters or ride-hailing apps at airports and train stations.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Water &amp; Food Hygiene:</strong> Drink only packaged or filtered mineral water. When dining at local stalls, pick bustling eateries where food is cooked fresh and served piping hot.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Document Safeguards:</strong> Keep digital backups of your Aadhaar card/Passport and hotel bookings on cloud storage (e.g. Google Drive/DigiLocker).
                </div>
            </div>
        </div>

        <!-- 3. Budget Travel Suggestions -->
        <div class="tip-category-card">
            <div class="tip-card-header">
                <div class="tip-category-icon icon-budget">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <path d="M16 8h-6a2 2 0 1 0 0 4h4a2 2 0 1 1 0 4H8"></path>
                        <path d="M12 18V6"></path>
                    </svg>
                </div>
                <div>
                    <span style="font-size: 0.78rem; text-transform: uppercase; font-weight: 700; color: #d97706; letter-spacing: 0.05em;">Smart Savings</span>
                    <h2 class="tip-card-title">Budget Travel Suggestions</h2>
                </div>
            </div>

            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Indian Railways Travel:</strong> India's vast rail network (IRCTC) offers an economical, scenic way to travel between cities. Book 3A or 2A classes well in advance for comfortable overnight trips.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Homestays &amp; Hostels:</strong> Opt for state tourism-approved homestays (e.g. in Kerala or Himachal) or trusted backpacker chains for clean, social accommodation at a fraction of hotel costs.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Composite Monument Tickets:</strong> In heritage cities like Jaipur and Agra, purchase combined entry passes from the Archaeological Survey of India (ASI) rather than individual tickets.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Travel in Shoulder Seasons:</strong> Traveling right before or after peak season (e.g. February–March or September–October) yields up to 40% discounts on houseboats and resorts.
                </div>
            </div>
        </div>

        <!-- 4. Responsible Tourism -->
        <div class="tip-category-card">
            <div class="tip-card-header">
                <div class="tip-category-icon icon-responsible">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm0 18a8 8 0 1 1 8-8 8 8 0 0 1-8 8z"></path>
                        <path d="M12 6a6 6 0 0 0-6 6c0 3.31 2.69 6 6 6s6-2.69 6-6"></path>
                    </svg>
                </div>
                <div>
                    <span style="font-size: 0.78rem; text-transform: uppercase; font-weight: 700; color: #16a34a; letter-spacing: 0.05em;">Sustainability</span>
                    <h2 class="tip-card-title">Responsible Tourism</h2>
                </div>
            </div>

            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Zero Single-Use Plastic:</strong> Carry a reusable stainless steel water bottle and refill at RO filtration stations. Help preserve pristine mountain trails and beaches.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Support Local Artisans:</strong> Purchase handcrafted shawls, tea, pottery, and textiles directly from local artisan cooperatives and self-help groups rather than commercial intermediaries.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Preserve Heritage Structures:</strong> Never scratch names or touch delicate marble carvings or frescoes at monuments like the Taj Mahal, Amer Fort, or Konark.
                </div>
            </div>
            <div class="tip-item-styled">
                <span class="tip-check-icon">&#10003;</span>
                <div>
                    <strong>Respect Local Rituals:</strong> Always ask permission before photographing individuals, sadhus, or religious ceremonies along the Varanasi Ghats or in remote tribal hamlets.
                </div>
            </div>
        </div>

    </div>

    <!-- Quick Advisory Banner -->
    <div style="background: linear-gradient(135deg, var(--color-primary), var(--color-teal)); border-radius: var(--radius-lg); padding: 2.25rem; color: #ffffff; display: flex; align-items: center; justify-content: space-between; flex-wrap: gap; gap: 1.5rem;">
        <div>
            <h3 style="font-size: 1.4rem; font-weight: 700; margin-bottom: 0.35rem;">Need destination-specific advice?</h3>
            <p style="color: #cbd5e1; font-size: 0.95rem;">Every destination in our directory contains tailored travel tips and ideal seasonal advice.</p>
        </div>
        <a href="${pageContext.request.contextPath}/destinations" class="btn btn-primary" style="white-space: nowrap;">
            Browse Destinations
        </a>
    </div>

</div>

<jsp:include page="/common/footer.jsp" />
