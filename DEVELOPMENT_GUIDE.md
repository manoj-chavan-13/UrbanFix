# 🗺️ Development Guide & Execution Roadmap

This document outlines the exact order in which you should complete the tasks left in the codebase. 

Because the entire project is pre-structured with empty functions and detailed `TASK` comments, you simply need to follow this Sprint-by-Sprint guide, opening the specific files mentioned, and filling out the functions!


## 🚀 The Build Order

### Sprint 1: Database & Auth Foundations
**Goal:** Connect to the database and allow users to log in without passwords (OTP).
1. **File:** `backend/src/server.js`
   - Complete the `mongoose.connect()` logic using `process.env.MONGO_URI`.
2. **File:** `backend/src/models/user.model.js`
   - Define the Mongoose schema for the Customer.
3. **File:** `backend/src/controllers/auth.controller.js`
   - Complete the `sendOtp` function (generate 6 digits, save to DB/Redis).
   - Complete the `verifyOtp` function (validate OTP, create User, issue JWT).
4. **File:** `customer-app/src/screens/LoginScreen.jsx`
   - Complete the React logic to call your new API endpoints and save the JWT to `localStorage`.

### Sprint 2: Core Provider Systems & GeoSearch
**Goal:** Setup providers and allow customers to find them based on GPS distance.
1. **File:** `backend/src/models/provider.model.js`
   - Define the `Provider` schema and the highly critical `ProviderLocation` schema with the `2dsphere` index.
2. **File:** `backend/src/controllers/provider.controller.js`
   - Complete the `toggleAvailability` function (updating ONLINE/OFFLINE status).
   - **CRITICAL:** Complete the `getNearbyProviders` function using MongoDB's `$near` operator.
3. **File:** `customer-app/src/screens/HomeScreen.jsx`
   - Complete `getUserLocation()` using the browser's Geolocation API.
   - Complete `fetchNearbyProviders()` to hit your new backend endpoint.

### Sprint 3: The Booking Engine (The Hardest Part)
**Goal:** Create the transactional lifecycle between a customer and a provider.
1. **File:** `backend/src/models/booking.model.js`
   - Define the schema to link Customer, Provider, and Status.
2. **File:** `backend/src/controllers/booking.controller.js`
   - Complete `createBooking` (save as PENDING, emit socket event).
   - Complete `acceptBooking` (change to ACCEPTED, emit socket event).
3. **File:** `customer-app/src/screens/BookingScreen.jsx`
   - Complete `executeBookingApi()`.
4. **File:** `provider-app/src/screens/DashboardScreen.jsx`
   - Complete the `handleIncomingJob()` logic to show the 60-second popup.
   - Complete the `acceptJob()` function to call the backend.

### Sprint 4: Live Socket.io Tracking
**Goal:** Uber-style live map updates.
1. **File:** `backend/src/server.js`
   - Complete the Socket.io `connection` listener. Ensure it listens for `locationUpdate` from the provider and broadcasts it to the specific customer.
2. **File:** `provider-app/src/screens/DashboardScreen.jsx`
   - Complete `startLocationBroadcast()` using `navigator.geolocation.watchPosition` to emit GPS data.
3. **File:** `customer-app/src/screens/TrackingScreen.jsx`
   - Complete `setupSocketListeners()` to catch the coordinates and update your frontend state.

### Sprint 5: Admin Panel & Trust Operations
**Goal:** Give yourself control over the marketplace.
1. **File:** `admin-panel/src/pages/AdminDashboard.jsx`
   - Complete the `useEffect` fetch to get pending KYC providers.
   - Complete the `approveProvider()` function to validate them on the backend.


## 💡 Important Startup Advice: "Supply First"
When you finish coding and deploy this app, **DO NOT** launch it to customers immediately. 
1. Open the Provider App on your phone.
2. Physically walk to local hardware shops, plumbing stores, and electrical repair stalls.
3. Show them the app, explain how they get leads, and register 50 of them manually.
4. ONLY THEN do you start marketing the Customer App to households in that specific ZIP code. 
Marketplace liquidity relies entirely on having enough technicians available *before* a customer searches!
