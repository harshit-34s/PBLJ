# Tourist Information System (Incredible India Explorer)

A complete, production-ready Java Web Application designed using the **Model-View-Controller (MVC)** architectural pattern. The system enables tourists to explore iconic travel destinations across India, search and filter destinations by multiple criteria, review comprehensive itineraries and attractions, check estimated budgets in INR, and access curated safety, packing, and eco-tourism guidelines.

Built strictly with standard Java enterprise specifications—**no Spring Boot, React, Node.js, or MySQL database required**.

---

## 🌟 Key Features

1. **Interactive Home Showcase:**
   - Hero banner with quick navigation actions and highlight badges.
   - Live travel metrics strip (Iconic Destinations, Travel Themes, States, XML Data Engine).
   - Spotlight cards for featured destinations with quick previews.
   - Quick theme navigation (Heritage, Hill Station, Beach, Spiritual, Nature).

2. **Destination Catalog & Directory:**
   - Clean, responsive destination cards with rounded corners, subtle elevation, and hover zoom effects.
   - Displays photography (with automatic SVG fallback handling if offline), location pins, category badges, estimated budgets, and recommended stay durations.

3. **Multi-Criteria Search & Filter Engine:**
   - **Full-Text Search:** Case-insensitive search across destination name, city, and state.
   - **Category Filter:** Filter by theme (Heritage, Hill Station, Beach, Spiritual, Nature, etc.).
   - **State Filter:** Filter by Indian states (Uttar Pradesh, Himachal Pradesh, Rajasthan, Kerala, Punjab, Goa, West Bengal).
   - **Unified Conjunction:** Search query and dropdown filters work seamlessly together.
   - **Active Filter Chips & Reset:** Visual tags indicating applied filters and one-click reset.
   - **Friendly Empty State:** Helpful guidance when no destinations match criteria.

4. **In-Depth Destination Details:**
   - High-resolution hero display with categorized location tags.
   - Comprehensive historical and cultural descriptions.
   - Grid of major local attractions and landmarks.
   - Travel summary card: Best time to visit, estimated budget per person in INR, recommended duration, and travel theme.
   - Practical destination-specific travel tips.
   - Contextual "You Might Also Like" related destinations list.

5. **Curated Travel Advice Hub:**
   - **Packing Advice:** Layered apparel for high altitudes, modest dress codes for places of worship, first-aid essentials, and universal adapters.
   - **Safety Guidance:** National Tourist Helplines (1363 / 112), authorized guide verification, food and water safety.
   - **Budget Travel Suggestions:** IRCTC rail network tips, government homestays, shoulder-season travel savings.
   - **Responsible Tourism:** Zero single-use plastic, respecting heritage monuments, and supporting local artisan cooperatives.

6. **System Architecture & Viva Guide (About Page):**
   - In-depth explanation of the MVC pattern and Jakarta EE servlet request cycle.
   - Viva examination Q&A cheat sheet addressing common viva defense questions.

7. **Error & Edge-Case Handling:**
   - Dedicated error controller and view (`error.jsp`) handling 400, 404, and 500 scenarios.
   - Safe input sanitization avoiding XSS vulnerabilities.

---

## 🛠️ Technology Stack

| Layer | Technology | Details |
| :--- | :--- | :--- |
| **Language & Platform** | Java 17+ | Compatible with modern JDKs including JDK 17 through JDK 25 |
| **Web Controller** | Jakarta Servlet API 6.0 | Pure controller servlets using `jakarta.servlet.*` |
| **View Template** | JSP 3.1 & JSTL 3.0 | Clean Expression Language (`${...}`) without scriptlets |
| **Data Storage** | XML (`destinations.xml`) | Structured XML parsed via DOM with OWASP XXE protection |
| **Application Server** | Apache Tomcat 10.1+ / 11.0+ | Jakarta EE 10 / 11 compliant servlet container |
| **Build & Packaging** | Apache Maven 3.9+ | Standard WAR packaging (`tourist-information-system.war`) |
| **Frontend & Styling** | HTML5, CSS3, Vanilla JS | Deep blue, teal, crisp white & warm amber color palette |

---

## 📁 Project Directory Structure

```text
TouristInformationSystem/
├── pom.xml                                     # Maven project configuration (Java 17, Jakarta EE 10)
├── README.md                                   # Comprehensive project documentation
└── src/
    ├── main/
    │   ├── java/
    │   │   └── com/
    │   │       └── tourism/
    │   │           ├── model/
    │   │           │   └── Destination.java    # Domain model POJO with full travel attributes
    │   │           ├── servlet/
    │   │           │   ├── HomeServlet.java    # Controller for home view & featured showcase
    │   │           │   ├── DestinationServlet.java # Controller for search & multi-filter catalog
    │   │           │   ├── DestinationDetailsServlet.java # Controller for single destination view
    │   │           │   ├── TravelTipsServlet.java  # Controller for travel advisory guide
    │   │           │   └── AboutServlet.java   # Controller for system architecture view
    │   │           └── util/
    │   │               └── XMLDataReader.java  # Safe XML DOM parser with OWASP XXE defense
    │   ├── resources/
    │   │   └── destinations.xml                # Destination data store (8+ Indian destinations)
    │   └── webapp/
    │       ├── WEB-INF/
    │       │   └── web.xml                     # Jakarta EE 6.0 deployment descriptor
    │       ├── common/
    │       │   ├── header.jsp                  # Global header, brand navigation & mobile menu
    │       │   └── footer.jsp                  # Global footer, quick links, tech badges & helpline
    │       ├── css/
    │       │   └── style.css                   # Custom responsive stylesheet
    │       ├── images/
    │       │   └── fallback.svg                # Standalone vector fallback illustration
    │       ├── js/
    │       │   └── main.js                     # Vanilla JS: mobile nav, image fallback, auto-filter
    │       ├── index.jsp                       # Root welcome page forwarding to /home controller
    │       ├── home.jsp                        # Home view
    │       ├── destinations.jsp                # Catalog, search & filter view
    │       ├── destination-details.jsp         # Destination details view
    │       ├── travel-tips.jsp                 # Travel tips view
    │       ├── about.jsp                       # About & viva defense view
    │       └── error.jsp                       # Friendly error view
    └── test/
        └── java/
            └── com/
                └── tourism/
                    └── util/
                        └── XMLDataReaderTest.java # 8 Unit tests validating XML parsing & filters
```

---

## 🏛️ Architecture & Design Pattern (MVC)

The system adheres strictly to the **Model-View-Controller** design pattern:

```
[ Browser / Client ]
         │
         │  1. HTTP GET (/destinations?category=Heritage&q=Agra)
         ▼
[ Jakarta Servlets (Controller) ]
  • DestinationServlet / HomeServlet / DestinationDetailsServlet
         │
         │  2. Query & Filter
         ▼
[ XMLDataReader (Utility) ] ── Parses ──► [ destinations.xml (Data Store) ]
         │                                (OWASP XXE Protection Enabled)
         │  3. Populates
         ▼
[ Destination (Model POJO) ]
         │
         │  4. request.setAttribute("destinations", list)
         ▼
[ JSP 3.1 & JSTL 3.0 (View) ] ── Dispatches ──► [ Rendered HTML/CSS to User ]
```

### Key Security & Quality Implementation Details:
1. **OWASP XXE Prevention:**
   In `XMLDataReader.java`, `DocumentBuilderFactory` disables `DOCTYPE` declarations, external general entities, and parameter entities to eliminate XML External Entity (XXE) injection vulnerabilities.
2. **Zero Scriptlets Policy:**
   All JSP files use JSP Expression Language (`${...}`) and standard JSTL tags (`<c:forEach>`, `<c:if>`, `<c:choose>`, `<c:out>`). Scriptlets (`<% ... %>`) are completely avoided.
3. **Data-Driven Architecture:**
   All destination names, cities, states, descriptions, attractions, budgets, durations, and tips are read dynamically from `destinations.xml` at runtime.

---

## 🚀 Build Instructions

### Prerequisites
- **JDK 17 or newer** (JDK 17, 21, or 25 installed)
- **Apache Maven 3.8+**
- **Apache Tomcat 10.1+** (or Tomcat 11.0+)

### Step 1: Clone or Open the Workspace
Open a terminal in the project directory:
```powershell
cd "c:\vscode practicals\TouristInformationSystem"
```

### Step 2: Build and Test with Maven
Execute the standard Maven build:
```powershell
mvn clean package
```

**Build Output:**
- Executes all 8 automated unit tests in `XMLDataReaderTest`.
- Compiles all Java source code using Java 17 release compatibility.
- Packages the web application into:
  `target/tourist-information-system.war`

---

## 📦 Deployment Instructions (Apache Tomcat on Windows)

Apache Tomcat 10.1 and 11.0 use Jakarta EE 10/11 with the `jakarta.*` namespace, which directly matches this project's configuration.

### Method 1: Automatic Deployment via Tomcat Webapps Directory

1. **Locate your Tomcat installation folder**, commonly:
   - `C:\Program Files\Apache Software Foundation\Tomcat 10.1` (or `Tomcat 11.0`)
   - Or a standalone extracted folder such as `C:\apache-tomcat-10.1.x`

2. **Copy the WAR file to Tomcat's `webapps` folder:**
   - Open **PowerShell as Administrator** (or File Explorer with admin rights).
   - Run the following command:
     ```powershell
     Copy-Item "C:\vscode practicals\TouristInformationSystem\target\tourist-information-system.war" "C:\Program Files\Apache Software Foundation\Tomcat 11.0\webapps\tourist-information-system.war"
     ```
   *(Adjust the destination path if your Tomcat folder is named `Tomcat 10.1`)*.

3. **Start / Restart Tomcat Service:**
   - If running as a Windows Service:
     ```powershell
     Restart-Service -Name Tomcat11
     ```
     *(or `Restart-Service -Name Tomcat10`)*
   - Or if using standalone Tomcat:
     ```powershell
     cd "C:\apache-tomcat-10.1.x\bin"
     .\startup.bat
     ```

4. Tomcat will automatically extract `tourist-information-system.war` into a directory named `tourist-information-system`.

---

### Method 2: Deployment via Tomcat Web Manager

If you have Tomcat Manager enabled:
1. Open your browser and go to `http://localhost:8080/manager/html`.
2. Enter your manager credentials configured in Tomcat's `conf/tomcat-users.xml`.
3. Scroll down to **WAR file to deploy**.
4. Click **Browse...**, select `C:\vscode practicals\TouristInformationSystem\target\tourist-information-system.war`, and click **Deploy**.

---

## 🌐 How to Open the Application in Your Browser

Once deployed, open any web browser and navigate to:

👉 **[http://localhost:8080/tourist-information-system/](http://localhost:8080/tourist-information-system/)**

Direct Page URLs:
- **Home:** `http://localhost:8080/tourist-information-system/home`
- **Destinations Directory:** `http://localhost:8080/tourist-information-system/destinations`
- **Taj Mahal Details:** `http://localhost:8080/tourist-information-system/destination-details?id=taj-mahal`
- **Manali Details:** `http://localhost:8080/tourist-information-system/destination-details?id=manali`
- **Travel Tips:** `http://localhost:8080/tourist-information-system/travel-tips`
- **About & MVC Architecture:** `http://localhost:8080/tourist-information-system/about`

---

## 🔍 Verification & Testing Checklist

- [x] **Home page loads:** Hero banner, stats, featured destinations, and navigation links.
- [x] **Catalog & Cards:** Displays all 8 destinations with images, location, category badges, and budgets.
- [x] **Keyword Search:** Search for "Agra", "Manali", "Temple", or "Ghats".
- [x] **Category Filter:** Filter by "Heritage", "Hill Station", "Beach", "Spiritual", or "Nature".
- [x] **State Filter:** Filter by "Himachal Pradesh", "Kerala", "Rajasthan", "Goa", etc.
- [x] **Combined Search & Filter:** Filter by Category "Heritage" + Query "Amer" or "Jaipur".
- [x] **Reset Filters:** Click "Reset" or "Clear All" to restore full listing.
- [x] **Destination Details:** View attractions, best time to visit, recommended duration, INR budget, and tips.
- [x] **Related Places:** Side recommendations on destination details pages.
- [x] **Travel Tips:** Four dedicated advisory sections (Packing, Safety, Budget, Eco-Tourism).
- [x] **Error Handling:** Visiting an invalid ID like `/destination-details?id=invalid-id` displays a friendly error page.
- [x] **Mobile Responsiveness:** Navigation smoothly transforms to a toggle hamburger menu on mobile screens.

---

## ❓ Troubleshooting

| Issue | Cause | Solution |
| :--- | :--- | :--- |
| **HTTP 404 on root URL** | Tomcat has not expanded the WAR yet | Wait 5–10 seconds after copying the WAR, or verify Tomcat is running on port 8080. |
| **Access Denied when copying WAR** | `Program Files` is protected by Windows UAC | Run PowerShell as Administrator to copy files into `Tomcat\webapps`. |
| **Port 8080 in use** | Another service or previous Tomcat process is active | Check port usage with `netstat -ano \| findstr :8080` or change port in Tomcat's `conf/server.xml`. |
| **Broken external images** | Network firewall or offline browsing | An automatic SVG fallback (`images/fallback.svg`) is triggered to render a placeholder without breaking the UI. |

---

## 👨‍💻 Project Viva & College Defense Summary

When explaining this project to an examiner:
1. **Highlight the MVC separation:** Show how `DestinationServlet` handles HTTP parameters, invokes `XMLDataReader`, and binds data to request attributes before forwarding to `destinations.jsp`.
2. **Explain the XML Data Model:** Demonstrate `destinations.xml` and how the DOM parser populates `Destination.java` objects with zero database overhead.
3. **Showcase XXE Security:** Point out the security flags in `XMLDataReader.java` that disable DTD processing to safeguard against XML vulnerabilities.
4. **Demonstrate JSTL & EL:** Show how `c:forEach` and `${dest.name}` replace old-fashioned scriptlets for cleaner, modern JSP code.
