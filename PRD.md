# PRODUCT REQUIREMENTS DOCUMENT (PRD)

## Project Working Name: UrbanFix

### 1. Product Overview
Build a **hyperlocal service marketplace** where users can instantly discover, book, and manage trusted nearby home service professionals (plumbers, electricians, carpenters, AC repair, cleaning, etc.).

**Primary Goal:** Create a trusted local home services platform with verified technicians, fast booking, transparent pricing, and real-time appointment management.
**Secondary Goal:** Empower local technicians with a digital business operating system.

### 2. Target Audience
**Primary Users:** Homeowners, working professionals, families, small businesses needing quick, reliable service.
**Supply Side:** Technicians (plumbers, electricians, carpenters, etc.) seeking consistent work and a digital presence.

### 3. MVP Scope
**Launch one city only (e.g., Bhiwandi) to build marketplace liquidity.**
**Initial Categories:**
1. Plumber (pipe leak, tap repair, toilet issue, etc.)
2. Electrician (switch repair, wiring, etc.)
3. Carpenter (furniture repair, door lock, etc.)
4. AC Repair (gas refill, servicing)
5. Cleaning (deep cleaning, sofa cleaning)

### 4. Key Metrics (KPIs)
- Booking Success Rate: > 70%
- Repeat Customer Rate: > 40%
- Average Response Time: < 10 mins
- Customer Rating: 4.5+
- Provider Retention: > 60%

### 5. Features Priority
**P0 (MUST HAVE)**
- Customer: OTP login, categories, nearby providers, booking, payments, tracking.
- Provider: Signup/KYC, accept/reject, calendar, earnings.
- Admin: Provider approval, disputes, booking management.

### 6. Tech Stack
- **Frontend (Customer & Provider):** React Native
- **Admin Panel:** React (Web)
- **Backend:** Node.js + Express.js (Monolith)
- **Database:** MongoDB (Mongoose)
- **Realtime:** Socket.io (Tracking, notifications)
- **Storage:** Cloudinary (Docs, images)
- **Payments:** Razorpay
- **Maps:** Google Maps API (Geosearch, distance)

### 7. Database Design
Core collections: `users`, `providers`, `services`, `categories`, `bookings`, `payments`, `reviews`, `addresses`.

*Refer to the other documentation files for architecture, development guidelines, and specific file logic.*
