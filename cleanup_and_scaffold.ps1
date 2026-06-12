$rootDir = "m:\PROJECT\OPENSOURCE\UrbanFix"

function Create-File {
    param([string]$path, [string]$content)
    $dir = Split-Path $path -Parent
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    Set-Content -Path $path -Value $content -Encoding UTF8
}

# 1. Clean up old React Native JS files in src folders to prevent confusion
$frontendApps = @("customer-app", "provider-app", "admin-panel")
foreach ($app in $frontendApps) {
    $srcPath = Join-Path $rootDir "$app\src"
    if (Test-Path $srcPath) {
        Remove-Item -Path $srcPath -Recurse -Force
    }
}

# ==========================================
# CUSTOMER APP (.jsx)
# ==========================================
$customerApp = Join-Path $rootDir "customer-app"

Create-File (Join-Path $customerApp "src\main.jsx") 'import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);'

Create-File (Join-Path $customerApp "src\App.jsx") '/**
 * TASK: Main Routing & Auth Provider Setup
 */
import { BrowserRouter, Routes, Route } from "react-router-dom";
import HomeScreen from "./screens/HomeScreen.jsx";
import ProviderListScreen from "./screens/ProviderListScreen.jsx";
import BookingScreen from "./screens/BookingScreen.jsx";
import TrackingScreen from "./screens/TrackingScreen.jsx";
import LoginScreen from "./screens/LoginScreen.jsx";

export default function App() {
  // HALF COMPLETED LOGIC: Auth Check
  // const [user, setUser] = useState(null);
  // useEffect(() => { check token in localStorage... })

  return (
    <BrowserRouter>
      {/* TODO: Wrap with AuthContext.Provider */}
      <Routes>
        <Route path="/login" element={<LoginScreen />} />
        <Route path="/" element={<HomeScreen />} />
        <Route path="/providers" element={<ProviderListScreen />} />
        <Route path="/book/:providerId" element={<BookingScreen />} />
        <Route path="/track/:bookingId" element={<TrackingScreen />} />
      </Routes>
    </BrowserRouter>
  );
}'

Create-File (Join-Path $customerApp "src\screens\HomeScreen.jsx") '/**
 * TASK: Home Screen UI & Geo-Location Logic
 */
import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function HomeScreen() {
  const [categories, setCategories] = useState([]);
  const [nearbyProviders, setNearbyProviders] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    // TASK: Fetch categories
    // axios.get("/api/v1/categories").then(res => setCategories(res.data));
    
    // HALF-COMPLETED LOCATION LOGIC:
    // navigator.geolocation.getCurrentPosition((pos) => {
    //    fetchNearbyProviders(pos.coords.latitude, pos.coords.longitude);
    // });
  }, []);

  const fetchNearbyProviders = async (lat, lng) => {
    // TASK: Call GET /api/v1/providers/nearby?lat=...&lng=...
  };

  return (
    <div className="home-container">
      <header><h1>UrbanFix</h1></header>
      <section>
        <h2>Services</h2>
        <div onClick={() => navigate("/providers?category=plumber")}>Plumber</div>
      </section>
      <section>
        <h2>Nearby Professionals</h2>
        {/* TODO: Map nearbyProviders to UI cards */}
      </section>
    </div>
  );
}'

Create-File (Join-Path $customerApp "src\screens\ProviderListScreen.jsx") '/**
 * TASK: Show Filtered Providers & Connect to Booking
 */
import React, { useState, useEffect } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";

export default function ProviderListScreen() {
  const [searchParams] = useSearchParams();
  const [providers, setProviders] = useState([]);
  const navigate = useNavigate();
  const category = searchParams.get("category");

  useEffect(() => {
    // TASK: Fetch providers by category
    // axios.get(`/api/v1/providers/category/${category}`).then(...)
  }, [category]);

  return (
    <div>
      <h1>Providers for {category}</h1>
      {/* HALF-COMPLETED RENDER */}
      {/* providers.map(p => (
          <div key={p._id}>
             <h3>{p.fullName}</h3>
             <button onClick={() => navigate(`/book/${p._id}`)}>Book Now</button>
          </div>
      )) */}
    </div>
  );
}'

Create-File (Join-Path $customerApp "src\screens\BookingScreen.jsx") '/**
 * TASK: Finalize Booking API Call
 */
import React, { useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";

export default function BookingScreen() {
  const { providerId } = useParams();
  const [issue, setIssue] = useState("");
  const navigate = useNavigate();

  const handleBook = async () => {
    // HALF-COMPLETED BOOKING CALL
    /*
    try {
       const res = await axios.post("/api/v1/bookings/create", {
           providerId,
           serviceId: "TODO",
           issueDescription: issue
       });
       if(res.data.success) {
           navigate(`/track/${res.data.bookingId}`);
       }
    } catch(err) { console.error(err); }
    */
  };

  return (
    <div>
      <h1>Confirm Booking</h1>
      <textarea placeholder="Describe the issue" value={issue} onChange={e => setIssue(e.target.value)} />
      <button onClick={handleBook}>Confirm & Book</button>
    </div>
  );
}'

Create-File (Join-Path $customerApp "src\screens\TrackingScreen.jsx") '/**
 * TASK: Live Tracking with Socket.io
 */
import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import io from "socket.io-client";

export default function TrackingScreen() {
  const { bookingId } = useParams();
  const [status, setStatus] = useState("WAITING_FOR_PROVIDER");
  const [providerLocation, setProviderLocation] = useState(null);

  useEffect(() => {
    // HALF-COMPLETED SOCKET:
    /*
    const socket = io("http://localhost:5000", { auth: { token: "..." } });
    
    socket.emit("joinBookingRoom", bookingId);
    
    socket.on("bookingStatusUpdated", (newStatus) => setStatus(newStatus));
    socket.on("providerLocationUpdate", (coords) => setProviderLocation(coords));

    return () => socket.disconnect();
    */
  }, [bookingId]);

  return (
    <div>
      <h1>Live Tracking</h1>
      <p>Status: {status}</p>
      {/* TODO: Add Google Maps component showing providerLocation */}
    </div>
  );
}'

Create-File (Join-Path $customerApp "src\screens\LoginScreen.jsx") '/**
 * TASK: OTP Login UI
 */
import React, { useState } from "react";
import axios from "axios";

export default function LoginScreen() {
  const [phone, setPhone] = useState("");
  const [otp, setOtp] = useState("");
  const [step, setStep] = useState(1); // 1 = Phone, 2 = OTP

  const sendOtp = async () => {
    // await axios.post("/api/v1/auth/send-otp", { phone });
    setStep(2);
  };

  const verifyOtp = async () => {
    // const res = await axios.post("/api/v1/auth/verify-otp", { phone, otp });
    // localStorage.setItem("token", res.data.token);
    // window.location.href = "/";
  };

  return (
    <div>
      <h1>Login</h1>
      {step === 1 ? (
        <><input value={phone} onChange={e => setPhone(e.target.value)} /><button onClick={sendOtp}>Send OTP</button></>
      ) : (
        <><input value={otp} onChange={e => setOtp(e.target.value)} /><button onClick={verifyOtp}>Verify</button></>
      )}
    </div>
  );
}'

# ==========================================
# PROVIDER APP (.jsx)
# ==========================================
$providerApp = Join-Path $rootDir "provider-app"

Create-File (Join-Path $providerApp "src\main.jsx") 'import React from "react";
import ReactDOM from "react-dom/client";
import DashboardScreen from "./screens/DashboardScreen.jsx";

ReactDOM.createRoot(document.getElementById("root")).render(<DashboardScreen />);'

Create-File (Join-Path $providerApp "src\screens\DashboardScreen.jsx") '/**
 * TASK: Provider Dashboard & Incoming Requests
 */
import React, { useState, useEffect } from "react";
import io from "socket.io-client";
import axios from "axios";

export default function DashboardScreen() {
  const [isOnline, setIsOnline] = useState(false);
  const [incomingJob, setIncomingJob] = useState(null);
  
  useEffect(() => {
    // HALF-COMPLETED SOCKET SETUP
    /*
    const socket = io("http://localhost:5000", { auth: { token: "..." } });
    socket.on("newBooking", (job) => {
       setIncomingJob(job);
       // TASK: Auto-reject if not accepted within 60s
       // setTimeout(() => setIncomingJob(null), 60000);
    });
    return () => socket.disconnect();
    */
  }, []);

  const handleToggleOnline = async () => {
    // TASK: Update provider status
    // await axios.patch("/api/v1/providers/status", { status: !isOnline ? "ONLINE" : "OFFLINE" });
    setIsOnline(!isOnline);
    
    // HALF COMPLETED GEOLOCATION BROADCAST:
    /*
    if (!isOnline) { // Means turning online
       navigator.geolocation.watchPosition(pos => {
          // socket.emit("locationUpdate", { lat: pos.coords.latitude, lng: pos.coords.longitude });
       });
    }
    */
  };

  const acceptJob = async () => {
    // TASK: Accept booking API
    // await axios.patch(`/api/v1/bookings/${incomingJob._id}/accept`);
    setIncomingJob(null);
    // TODO: Navigate to Active Job screen
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Provider Dashboard</h1>
      <button onClick={handleToggleOnline} style={{ background: isOnline ? "green" : "red" }}>
        {isOnline ? "GO OFFLINE" : "GO ONLINE"}
      </button>

      {incomingJob && (
        <div style={{ marginTop: "20px", border: "2px solid blue", padding: "20px" }}>
          <h2>🚨 New Job!</h2>
          <button onClick={acceptJob}>Accept</button>
        </div>
      )}
    </div>
  );
}'


# ==========================================
# ADMIN PANEL (.jsx)
# ==========================================
$adminPanel = Join-Path $rootDir "admin-panel"

Create-File (Join-Path $adminPanel "package.json") '{
  "name": "admin-panel",
  "version": "1.0.0",
  "type": "module",
  "scripts": { "dev": "vite", "build": "vite build" },
  "dependencies": { "react": "^18.2.0", "react-dom": "^18.2.0", "react-router-dom": "^6.20.0", "axios": "^1.6.0" },
  "devDependencies": { "@vitejs/plugin-react": "^4.2.0", "vite": "^5.0.0" }
}'

Create-File (Join-Path $adminPanel "vite.config.js") 'import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"
export default defineConfig({ plugins: [react()], server: { port: 3002 } })'

Create-File (Join-Path $adminPanel "index.html") '<!DOCTYPE html><html lang="en"><head><title>Admin Panel</title></head><body><div id="root"></div><script type="module" src="/src/main.jsx"></script></body></html>'

Create-File (Join-Path $adminPanel "src\main.jsx") 'import React from "react";
import ReactDOM from "react-dom/client";
import AdminDashboard from "./pages/AdminDashboard.jsx";
ReactDOM.createRoot(document.getElementById("root")).render(<AdminDashboard />);'

Create-File (Join-Path $adminPanel "src\pages\AdminDashboard.jsx") '/**
 * TASK: Admin Global Dashboard
 */
import React, { useState, useEffect } from "react";
import axios from "axios";

export default function AdminDashboard() {
  const [providers, setProviders] = useState([]);

  useEffect(() => {
    // HALF-COMPLETED PROVIDER FETCH
    /*
    axios.get("/api/v1/admin/providers/pending", { 
        headers: { Authorization: `Bearer admin_token` } 
    }).then(res => setProviders(res.data));
    */
  }, []);

  const approveProvider = async (id) => {
    // await axios.patch(`/api/v1/admin/providers/${id}/approve`);
    // setProviders(providers.filter(p => p._id !== id));
  };

  return (
    <div>
      <h1>Admin Dashboard</h1>
      <h2>Pending KYC Approvals</h2>
      {providers.map(p => (
         <div key={p._id}>
           <p>{p.fullName} - {p.phone}</p>
           {/* TODO: Add Image viewing for Aadhaar/Selfie */}
           <button onClick={() => approveProvider(p._id)}>Approve</button>
         </div>
      ))}
    </div>
  );
}'


# ==========================================
# BACKEND (.js) - Half completed logic
# ==========================================
$backend = Join-Path $rootDir "backend"

Create-File (Join-Path $backend "src\server.js") '/**
 * TASK: Server Entry Point & Socket Connection
 */
require("dotenv").config();
const http = require("http");
const app = require("./app");
const { Server } = require("socket.io");
const mongoose = require("mongoose");

const PORT = process.env.PORT || 5000;
const server = http.createServer(app);

// HALF COMPLETED SOCKET SERVER
const io = new Server(server, {
    cors: { origin: "*", methods: ["GET", "POST", "PATCH"] }
});

// Make IO globally accessible to controllers
global.io = io;

io.on("connection", (socket) => {
    console.log("New client connected", socket.id);
    
    // TASK: Handle location updates from providers
    socket.on("locationUpdate", (data) => {
        // TODO: Update provider location in DB
        // TODO: Broadcast to specific customer room if in active booking
        // io.to(`booking_${data.bookingId}`).emit("providerLocationUpdate", data.coords);
    });

    socket.on("disconnect", () => console.log("Client disconnected"));
});

// HALF COMPLETED DB CONNECTION
/*
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("MongoDB Connected");
        server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
    })
    .catch(err => console.error("DB Connection Error:", err));
*/
'

Create-File (Join-Path $backend "src\app.js") '/**
 * TASK: Express App Middleware & Routes
 */
const express = require("express");
const cors = require("cors");
// const authRoutes = require("./routes/auth.routes");
// const bookingRoutes = require("./routes/booking.routes");

const app = express();

app.use(cors());
app.use(express.json());

// HALF COMPLETED ROUTE MOUNTING
// app.use("/api/v1/auth", authRoutes);
// app.use("/api/v1/bookings", bookingRoutes);

// Global Error Handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ success: false, message: err.message });
});

module.exports = app;
'

Create-File (Join-Path $backend "src\controllers\auth.controller.js") '/**
 * TASK: OTP Generation and JWT Validation
 */
const User = require("../models/user.model");
const jwt = require("jsonwebtoken");

exports.sendOtp = async (req, res) => {
    const { phone } = req.body;
    // TASK: Generate random 6-digit OTP
    const otp = Math.floor(100000 + Math.random() * 900000);
    
    // HALF COMPLETED SMS INTEGRATION:
    // await smsService.send(phone, `Your UrbanFix OTP is ${otp}`);
    // await redis.setEx(`otp_${phone}`, 300, otp); // expire 5 mins

    res.status(200).json({ success: true, message: "OTP sent" });
};

exports.verifyOtp = async (req, res) => {
    const { phone, otp } = req.body;

    // TASK: Validate OTP from Redis/DB
    // const validOtp = await redis.get(`otp_${phone}`);
    // if(validOtp !== otp) return res.status(400).json({message: "Invalid OTP"});

    // HALF COMPLETED USER CREATION
    /*
    let user = await User.findOne({ phone });
    if (!user) {
        user = await User.create({ phone, role: "CUSTOMER" });
    }
    const token = jwt.sign({ id: user._id, role: user.role }, process.env.JWT_SECRET, { expiresIn: "7d" });
    res.status(200).json({ success: true, token, user });
    */
};
'

Create-File (Join-Path $backend "src\models\booking.model.js") '/**
 * TASK: Booking Schema Definition
 */
const mongoose = require("mongoose");

const bookingSchema = new mongoose.Schema({
    customerId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    providerId: { type: mongoose.Schema.Types.ObjectId, ref: "Provider", required: true },
    serviceId: { type: mongoose.Schema.Types.ObjectId, ref: "Service", required: true },
    issueDescription: { type: String },
    
    bookingStatus: {
        type: String,
        enum: ["PENDING", "ACCEPTED", "ON_THE_WAY", "STARTED", "COMPLETED", "CANCELLED"],
        default: "PENDING"
    },
    
    // HALF COMPLETED PAYMENT FIELDS
    // totalAmount: { type: Number },
    // paymentStatus: { type: String, enum: ["PENDING", "PAID", "FAILED"], default: "PENDING" }
}, { timestamps: true });

// TASK: Add indexes for faster querying
bookingSchema.index({ customerId: 1 });
bookingSchema.index({ providerId: 1 });
bookingSchema.index({ bookingStatus: 1 });

// module.exports = mongoose.model("Booking", bookingSchema);
'

Create-File (Join-Path $backend "src\models\provider.model.js") '/**
 * TASK: Provider Schema & GeoJSON
 */
const mongoose = require("mongoose");

const providerSchema = new mongoose.Schema({
    fullName: { type: String, required: true },
    phone: { type: String, required: true, unique: true },
    aadhaarNumber: { type: String },
    
    isApproved: { type: Boolean, default: false },
    status: { type: String, enum: ["ONLINE", "OFFLINE", "BUSY"], default: "OFFLINE" },
    
    // HALF COMPLETED RATINGS:
    // averageRating: { type: Number, default: 0 },
    // totalJobsCompleted: { type: Number, default: 0 }
}, { timestamps: true });

// module.exports = mongoose.model("Provider", providerSchema);

// TASK: Remember to create a separate ProviderLocation model for $near queries!
/*
const providerLocationSchema = new mongoose.Schema({
    providerId: { type: mongoose.Schema.Types.ObjectId, ref: "Provider" },
    location: {
        type: { type: String, enum: ["Point"], default: "Point" },
        coordinates: { type: [Number], required: true } // [longitude, latitude]
    }
});
providerLocationSchema.index({ location: "2dsphere" });
*/
'

Write-Host "Full detailed React+Vite (+.jsx files) and Backend scaffolding complete!"
