# scaffolding script for UrbanFix
$rootDir = "m:\PROJECT\OPENSOURCE\UrbanFix"

function Create-File {
    param([string]$path, [string]$content)
    $dir = Split-Path $path -Parent
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    Set-Content -Path $path -Value $content -Encoding UTF8
}

# BACKEND
$backend = Join-Path $rootDir "backend"

Create-File (Join-Path $backend "src\app.js") "/**
 * TASK: Express App Setup
 * 1. Initialize Express
 * 2. Setup Middleware (helmet, cors, express.json)
 * 3. Setup API Routes (/api/v1)
 * 4. Setup Global Error Handling
 */
"

Create-File (Join-Path $backend "src\server.js") "/**
 * TASK: Server Entry Point
 * 1. Connect to MongoDB (call DB connection utility)
 * 2. Initialize HTTP Server
 * 3. Initialize Socket.io instance and attach to server
 * 4. Listen on PORT from .env
 */
"

Create-File (Join-Path $backend "package.json") '{
  "name": "urbanfix-backend",
  "version": "1.0.0",
  "description": "Backend API for UrbanFix",
  "main": "src/server.js",
  "scripts": {
    "start": "node src/server.js",
    "dev": "nodemon src/server.js"
  }
}
'

Create-File (Join-Path $backend ".env.example") "PORT=5000
MONGO_URI=mongodb://localhost:27017/urbanfix
JWT_SECRET=your_jwt_secret
RAZORPAY_KEY=your_razorpay_key
GOOGLE_MAPS_KEY=your_maps_key
CLOUDINARY_KEY=your_cloudinary_key
"

# Controllers
Create-File (Join-Path $backend "src\controllers\auth.controller.js") "/**
 * TASK: Auth Controller
 * 1. sendOtp(req, res): Generate 6-digit OTP, send via SMS gateway, store hash in DB/Redis.
 * 2. verifyOtp(req, res): Validate OTP, check if user exists. Create user if new. Issue JWT token.
 * 3. refreshToken(req, res): Issue new access token using valid refresh token.
 */
"

Create-File (Join-Path $backend "src\controllers\booking.controller.js") "/**
 * TASK: Booking Controller
 * 1. createBooking(req, res): Save pending booking, emit to nearby providers via Socket.io.
 * 2. getBookingHistory(req, res): Return paginated history for user/provider.
 * 3. acceptBooking(req, res): Validate state, assign provider, notify user.
 * 4. updateBookingStatus(req, res): Update state (ON_THE_WAY, COMPLETED, etc.).
 */
"

Create-File (Join-Path $backend "src\controllers\provider.controller.js") "/**
 * TASK: Provider Controller
 * 1. registerProvider(req, res): Create provider profile (pending approval).
 * 2. uploadDocs(req, res): Handle Cloudinary uploads for Aadhaar/Selfie.
 * 3. getNearbyProviders(req, res): Use MongoDB `$near` query on `providerLocations` collection to find matches within 5km, sorted by rating/acceptance.
 * 4. toggleAvailability(req, res): Update provider online/offline status.
 */
"

# Models
Create-File (Join-Path $backend "src\models\user.model.js") "/**
 * TASK: User Model (Customer)
 * Schema fields: fullName, phone (unique), email, role, isVerified, defaultAddress, savedAddresses.
 * Ensure phone index for fast login.
 */
"

Create-File (Join-Path $backend "src\models\provider.model.js") "/**
 * TASK: Provider Model (Technician)
 * Schema fields: fullName, phone, aadhaarNumber, experience, bio, status, averageRating, services, earnings.
 * Indexes: phone, status, isApproved.
 */
"

Create-File (Join-Path $backend "src\models\booking.model.js") "/**
 * TASK: Booking Model
 * Schema fields: customerId, providerId, serviceId, bookingStatus, issueDescription, scheduledDate, totalAmount, paymentStatus.
 * Indexes: customerId, providerId, bookingStatus.
 */
"

Create-File (Join-Path $backend "src\models\address.model.js") "/**
 * TASK: Address Model
 * Schema fields: userId, label, fullAddress, location (GeoJSON Point).
 * Index: `location: '2dsphere'` for geosearch.
 */
"

# Routes
Create-File (Join-Path $backend "src\routes\auth.routes.js") "/**
 * TASK: Auth Routes
 * Define: POST /send-otp, POST /verify-otp
 * Connect to auth.controller
 */
"

Create-File (Join-Path $backend "src\routes\booking.routes.js") "/**
 * TASK: Booking Routes
 * Define: POST /create, GET /history, PATCH /:id/accept, PATCH /:id/status
 * Apply Auth + Role Middleware.
 */
"

# Services
Create-File (Join-Path $backend "src\services\sms.service.js") "/**
 * TASK: SMS Service
 * Integrate Fast2SMS or Twilio.
 * Function: sendSMS(phone, message)
 */
"

Create-File (Join-Path $backend "src\services\payment.service.js") "/**
 * TASK: Payment Service
 * 1. Integrate Razorpay.
 * 2. createOrder(amount, receiptId)
 * 3. verifySignature(orderId, paymentId, signature)
 */
"

# Sockets
Create-File (Join-Path $backend "src\sockets\index.js") "/**
 * TASK: Socket.io Setup
 * 1. Initialize io and verify JWT in socket handshake.
 * 2. Store active socket connections.
 * 3. Listeners: locationUpdate (from provider), providerOnline.
 * 4. Emitters: newBooking (to nearby providers), bookingAccepted (to customer), message (chat).
 */
"


# CUSTOMER APP
$customerApp = Join-Path $rootDir "customer-app"

Create-File (Join-Path $customerApp "App.js") "/**
 * TASK: Main App Entry for React Native
 * 1. Initialize NavigationContainer
 * 2. Load Auth/App stacks based on JWT token presence.
 * 3. Connect to Redux Provider.
 */
"

Create-File (Join-Path $customerApp "src\navigation\AppNavigator.js") "/**
 * TASK: Root Navigator
 * Stack definitions:
 * - Splash
 * - AuthStack (Login, OTP)
 * - MainStack (Home, Category, ProviderList, ProviderProfile, Booking, Tracking, History)
 */
"

Create-File (Join-Path $customerApp "src\screens\HomeScreen.js") "/**
 * TASK: Customer Home Screen
 * 1. UI: Header with user location.
 * 2. UI: Search Bar.
 * 3. UI: Grid of categories (Plumber, Electrician, etc.).
 * 4. UI: Horizontal list of 'Nearby Professionals'.
 * 5. Data: Fetch nearby providers from /api/v1/providers/nearby.
 */
"

Create-File (Join-Path $customerApp "src\screens\ProviderListScreen.js") "/**
 * TASK: Provider Search Results
 * 1. Show list of providers matching category and location.
 * 2. Filter tabs: Nearest, Top Rated, Cheapest.
 * 3. Provider Card: Photo, Rating, Distance, Starting Price.
 */
"

Create-File (Join-Path $customerApp "src\screens\BookingScreen.js") "/**
 * TASK: Finalize Booking
 * 1. Collect issue description, time slot, payment preference.
 * 2. Call /api/v1/bookings/create API.
 * 3. On success, navigate to TrackingScreen.
 */
"

Create-File (Join-Path $customerApp "src\screens\TrackingScreen.js") "/**
 * TASK: Live Tracking (Socket.io)
 * 1. Connect to Socket.io namespace.
 * 2. Listen for 'locationUpdate' to animate marker on Google Map.
 * 3. Listen for booking status updates (ACCEPTED, ON_THE_WAY, COMPLETED).
 */
"


# PROVIDER APP
$providerApp = Join-Path $rootDir "provider-app"

Create-File (Join-Path $providerApp "App.js") "/**
 * TASK: Main App Entry (Provider)
 * Separate app focused on driver/technician UX.
 * Setup Redux and Navigation.
 */
"

Create-File (Join-Path $providerApp "src\screens\DashboardScreen.js") "/**
 * TASK: Provider Dashboard
 * 1. UI: Huge toggle ONLINE / OFFLINE.
 * 2. Stats: Today's earnings, Jobs completed.
 * 3. Socket: When ONLINE, emit GPS location every 10s.
 * 4. UI: Display incoming booking requests via full-screen overlay popup.
 */
"

Create-File (Join-Path $providerApp "src\screens\JobDetailsScreen.js") "/**
 * TASK: Active Job Management
 * 1. UI: Customer location map + Navigation button.
 * 2. Actions: Start Job, Complete Job, Collect Cash/Payment.
 * 3. Call API to update booking status.
 */
"


# ADMIN PANEL
$adminPanel = Join-Path $rootDir "admin-panel"

Create-File (Join-Path $adminPanel "src\App.js") "/**
 * TASK: Admin React App
 * 1. Setup React Router.
 * 2. Layout with Sidebar and Topbar.
 * 3. Routes: Dashboard, Providers, Bookings, Disputes.
 */
"

Create-File (Join-Path $adminPanel "src\pages\ProviderApproval.js") "/**
 * TASK: KYC Approval Dashboard
 * 1. Fetch pending providers.
 * 2. UI: Table with Aadhaar, Selfie, Details.
 * 3. Actions: Approve (call /api/v1/admin/provider/:id/approve) or Reject.
 */
"

Create-File (Join-Path $adminPanel "src\pages\LiveMap.js") "/**
 * TASK: Admin Monitoring
 * 1. View all active providers on a map.
 * 2. Track active bookings.
 */
"

Write-Host "Scaffolding Complete!"
