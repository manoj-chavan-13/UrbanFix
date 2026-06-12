# 🛠️ UrbanFix (FixNear / KaamBuddy) - Master Repository

Welcome to the **UrbanFix** repository! This is a comprehensive, full-stack, hyper-local home service marketplace (similar to UrbanCompany). This project is designed specifically for Tier-2 and Tier-3 cities in India to solve the problem of finding reliable, affordable, and nearby technicians (plumbers, electricians, carpenters, etc.).

---

## 🎯 What is the Purpose of this Project?

This project aims to solve four major problems in the informal service sector:
1. **The Discovery Problem:** Users struggle to find reliable technicians nearby. They rely on word-of-mouth which is slow and inconsistent.
2. **The Trust Problem:** Users fear overpricing, poor quality of work, and safety risks from unverified workers.
3. **The Scheduling Problem:** Users have zero transparency on when a technician will actually arrive.
4. **The Technician Problem:** Local service providers suffer from inconsistent income and have no digital presence to build a reputation.

**The Solution:** UrbanFix is a platform that uses GPS location and real-time Socket.io websockets to match a customer with the nearest verified technician in under 60 seconds.

---

## 🚀 What Output Do We Expect?

By completing this codebase, you will have a fully functioning **Minimum Viable Product (MVP)** consisting of four major components:

1. **Customer App (`customer-app/`):** A Vite + ReactJS web application. Customers use this to login via OTP, browse services, find nearby providers using GPS, book an appointment, and track the provider's live location.
2. **Provider App (`provider-app/`):** A Vite + ReactJS web application. Technicians use this to toggle their "Online/Offline" status, receive real-time job alerts (with a 60-second acceptance timer), navigate to the customer, and track their earnings.
3. **Admin Panel (`admin-panel/`):** A Vite + ReactJS web application. Operations teams use this to manually approve technician KYC (Aadhaar/Selfies) and monitor live bookings.
4. **Backend Server (`backend/`):** A Node.js + Express.js monolithic API server. It acts as the brain of the operation, utilizing MongoDB for advanced `$near` GeoSpatial queries and Socket.io for live tracking.

---

## 🧠 The "Task-Driven" Codebase Architecture

This codebase has been uniquely scaffolded for rapid development. **You are not starting from scratch.** 

Every single critical file in the frontend (`src/screens/`) and backend (`src/controllers/`) has already been structured with empty functions and methods. Inside every empty function, there is a highly detailed, numbered `TASK` block. 

Your job is simply to read the numbered list inside the function and translate those instructions into JavaScript!

**Example from `customer-app/src/screens/HomeScreen.jsx`:**
```javascript
const fetchCategories = async () => {
    /**
     * TASK: Fetch Service Categories
     * 1. Execute GET request to '/api/v1/categories'
     * 2. Update 'categories' state with the response array
     * 3. Catch and log errors
     */
};
```

---

## 📂 Complete Directory Structure

```text
UrbanFix/
│
├── backend/                    # Node.js + Express API
│   ├── src/
│   │   ├── controllers/        # The brain (Auth, Booking, Provider logic)
│   │   ├── models/             # Mongoose Schemas (User, Provider, Booking)
│   │   ├── routes/             # API Endpoints
│   │   ├── server.js           # Server entry & Socket.io initialization
│   │   └── app.js              # Express middleware config
│   ├── package.json
│   └── .env.example
│
├── customer-app/               # ReactJS (Vite) Customer Portal
│   ├── src/
│   │   ├── screens/            # UI Screens (Home, Booking, Tracking, Login)
│   │   ├── App.jsx             # React Router setup
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
│
├── provider-app/               # ReactJS (Vite) Technician Portal
│   ├── src/
│   │   ├── screens/            # UI Screens (Dashboard, Job Details)
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
│
├── admin-panel/                # ReactJS (Vite) Admin Portal
│   ├── src/
│   │   ├── pages/              # Admin Dashboard
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
│
├── TEAM.md                     # Core Engineering Team & Motivation
├── PRD.md                      # Product Requirements Document
├── PROJECT_OVERVIEW.md         # Architecture & Database rules
└── DEVELOPMENT_GUIDE.md        # Step-by-Step execution roadmap
```

---

## 🏁 Where to Start?

1. Open **`DEVELOPMENT_GUIDE.md`** and read the Sprint Plan. 
2. Start with **Sprint 1 & 2** by opening `backend/src/controllers/auth.controller.js`.
3. Read the `TASK` comments inside `sendOtp` and `verifyOtp` and write the logic.
4. Move method by method, file by file, until the MVP is complete!
