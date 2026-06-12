# 🏗️ System Architecture & Project Overview

This document details exactly how the UrbanFix platform operates under the hood, why specific technologies were chosen, and how the database is structured.

## ⚙️ The Technology Stack

We are strictly utilizing the **MERN Stack + Vite + Socket.io**. 
Do NOT attempt to build a microservices architecture. A monolithic backend is required for MVP speed, easier debugging, and cheaper hosting.

- **Frontend Apps (`customer-app`, `provider-app`, `admin-panel`):** Built with **ReactJS** using **Vite**. Vite provides lightning-fast Hot Module Replacement (HMR) and optimized builds.
- **Backend API (`backend`):** Built with **Node.js** and **Express.js**.
- **Database:** **MongoDB** with Mongoose ODM. MongoDB is critical here because it natively supports GeoSpatial indexes (finding points on a map within a certain radius).
- **Real-Time Layer:** **Socket.io**. Used for live GPS tracking of technicians and instant popup notifications when a booking is created.


## 🗄️ Database Design (MongoDB)

You must implement the following collections in your Mongoose models (`backend/src/models/`).

### 1. `User` (Customers)
Stores the people booking the services.
- **Fields:** `phone` (String, unique), `role` (Enum: CUSTOMER), `isVerified` (Boolean).
- **Purpose:** Created automatically upon successful OTP verification.

### 2. `Provider` (Technicians)
Stores the supply-side workers.
- **Fields:** `fullName` (String), `phone` (String, unique), `aadhaarNumber` (String), `isApproved` (Boolean), `status` (Enum: ONLINE, OFFLINE, BUSY).
- **Purpose:** Holds permanent profile data. Admin must set `isApproved = true` before they can accept jobs.

### 3. `ProviderLocation` (Crucial for GeoSearch)
Stores the live coordinates of the provider. **Do not put this directly inside the Provider model**, as location updates happen every 10 seconds and you don't want to lock the main profile document constantly.
- **Fields:** `providerId` (ObjectId), `location` (GeoJSON Point: `[longitude, latitude]`).
- **Index required:** `location: "2dsphere"`.
- **Purpose:** Used by the `$near` operator to find technicians within 5km of a customer.

### 4. `Booking`
The transaction record connecting a User, a Provider, and a Service.
- **Fields:** `customerId` (ObjectId), `providerId` (ObjectId), `serviceId` (ObjectId), `bookingStatus` (Enum: PENDING, ACCEPTED, ON_THE_WAY, COMPLETED, CANCELLED).
- **Purpose:** Tracks the lifecycle of the job.


## 📡 The Real-Time Booking Engine (How it works)

This is the core functioning logic of the entire application. You must implement this flow using Express and Socket.io:

1. **Customer Location:** The Customer App grabs browser GPS coordinates (`navigator.geolocation`).
2. **Search:** Customer App sends a GET request to `/api/v1/providers/nearby?lat=X&lng=Y`.
3. **GeoQuery:** The Backend runs a MongoDB `$near` query to find `ProviderLocation` documents within 5000 meters where the linked Provider is `ONLINE` and `isApproved: true`.
4. **Booking Request:** Customer selects a provider and hits "Confirm Booking" (creates a `PENDING` booking in DB).
5. **Socket Emission:** Backend uses `global.io.to(providerId).emit('newBooking', data)` to ping the provider instantly.
6. **Provider Timer:** The Provider App shows a popup. The provider has 60 seconds to hit "Accept".
7. **Acceptance:** Provider hits Accept -> Backend changes booking status to `ACCEPTED` -> Backend emits `bookingAccepted` back to the Customer App.
8. **Live Tracking:** Provider App starts emitting `locationUpdate` every 10 seconds. Customer App map marker moves in real-time.
