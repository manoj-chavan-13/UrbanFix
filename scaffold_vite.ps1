# Detailed scaffolding script with Vite React + half-completed code
$rootDir = "m:\PROJECT\OPENSOURCE\UrbanFix"

function Create-File {
    param([string]$path, [string]$content)
    $dir = Split-Path $path -Parent
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    Set-Content -Path $path -Value $content -Encoding UTF8
}

# ==========================================
# BACKEND - Detailed Half-Completed Code
# ==========================================
$backend = Join-Path $rootDir "backend"

Create-File (Join-Path $backend "src\controllers\booking.controller.js") "/**
 * TASK: Implement Booking Controller
 */
const Booking = require('../models/booking.model');

exports.createBooking = async (req, res) => {
    try {
        const { serviceId, providerId, issueDescription, addressId } = req.body;
        
        // TODO: Validate inputs here

        // 1. Create a PENDING booking in database
        const newBooking = new Booking({
            customerId: req.user._id, // Assumes auth middleware sets req.user
            serviceId,
            providerId,
            addressId,
            issueDescription,
            bookingStatus: 'PENDING',
            // TODO: Calculate and set totalAmount, servicePrice, etc.
        });
        
        await newBooking.save();

        // 2. Emit socket event to notify provider
        // TODO: Import socket.io instance and emit 'newBooking' to providerId
        // global.io.to(providerId).emit('newBooking', newBooking);

        return res.status(201).json({ success: true, bookingId: newBooking._id });
    } catch (error) {
        console.error('Create booking error:', error);
        return res.status(500).json({ success: false, message: 'Internal Server Error' });
    }
};

exports.acceptBooking = async (req, res) => {
    try {
        const { bookingId } = req.params;
        const providerId = req.user._id;

        // TODO: Find the booking. Check if it is still PENDING.
        // const booking = await Booking.findById(bookingId);
        // if (booking.bookingStatus !== 'PENDING') { return error; }

        // TODO: Update bookingStatus to 'ACCEPTED' and save

        // TODO: Notify the customer via Socket.io that provider has accepted

        return res.status(200).json({ success: true, message: 'Booking accepted' });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
    }
};
"

Create-File (Join-Path $backend "src\controllers\provider.controller.js") "/**
 * TASK: Implement Provider Controller
 */
const Provider = require('../models/provider.model');

exports.getNearbyProviders = async (req, res) => {
    try {
        const { lat, lng, radius = 5000, serviceId } = req.query;

        if (!lat || !lng) {
            return res.status(400).json({ success: false, message: 'Coordinates required' });
        }

        // TODO: Use MongoDB `$near` operator on providerLocations collection
        // 1. Find locations within radius
        // 2. Populate provider details (filter by serviceId, isApproved: true, status: 'ONLINE')
        
        /* HALF COMPLETED CODE:
        const nearbyLocations = await ProviderLocation.find({
            location: {
                `$near`: {
                    `$geometry`: { type: 'Point', coordinates: [parseFloat(lng), parseFloat(lat)] },
                    `$maxDistance`: parseInt(radius)
                }
            }
        }).populate({
            path: 'providerId',
            match: { status: 'ONLINE', isApproved: true } // TODO: Add service filter
        });
        */

        // TODO: Return mapping of valid providers
        return res.status(200).json({ success: true, data: [] });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
    }
};
"

# ==========================================
# CUSTOMER APP - VITE REACTJS
# ==========================================
$customerApp = Join-Path $rootDir "customer-app"

Create-File (Join-Path $customerApp "package.json") '{
  "name": "customer-app",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.0",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.2.0",
    "vite": "^5.0.0"
  }
}'

Create-File (Join-Path $customerApp "vite.config.js") 'import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"

export default defineConfig({
  plugins: [react()],
  server: { port: 3000 }
})'

Create-File (Join-Path $customerApp "index.html") '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UrbanFix - Customer</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>'

Create-File (Join-Path $customerApp "src\main.jsx") 'import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);'

Create-File (Join-Path $customerApp "src\App.jsx") '/**
 * TASK: Main Routing Setup
 */
import { BrowserRouter, Routes, Route } from "react-router-dom";
import HomeScreen from "./screens/HomeScreen";
import ProviderListScreen from "./screens/ProviderListScreen";

function App() {
  return (
    <BrowserRouter>
      {/* TODO: Add Auth Context Provider here */}
      <Routes>
        <Route path="/" element={<HomeScreen />} />
        <Route path="/providers" element={<ProviderListScreen />} />
        {/* TODO: Add /booking/:id and /tracking routes */}
      </Routes>
    </BrowserRouter>
  );
}
export default App;'

Create-File (Join-Path $customerApp "src\screens\HomeScreen.jsx") '/**
 * TASK: Complete Home Screen UI & Logic
 */
import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function HomeScreen() {
  const [categories, setCategories] = useState([]);
  const [nearbyProviders, setNearbyProviders] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    // TODO: Fetch categories from API
    // axios.get("/api/v1/categories").then(res => setCategories(res.data));
    
    // HALF-COMPLETED LOCATION LOGIC:
    // navigator.geolocation.getCurrentPosition((pos) => {
    //    fetchNearbyProviders(pos.coords.latitude, pos.coords.longitude);
    // });
  }, []);

  return (
    <div className="home-container">
      <header>
        <h1>UrbanFix</h1>
        {/* TODO: Display current user location */}
      </header>

      <section className="categories-grid">
        <h2>Services</h2>
        {/* TODO: Map over categories array and render cards */}
        <div className="category-card" onClick={() => navigate("/providers?category=plumber")}>
          Plumber
        </div>
        {/* Add more categories statically for now until API is ready */}
      </section>

      <section className="nearby-providers">
        <h2>Professionals Near You</h2>
        {/* TODO: Render list of nearby provider cards */}
      </section>
    </div>
  );
}'


# ==========================================
# PROVIDER APP - VITE REACTJS
# ==========================================
$providerApp = Join-Path $rootDir "provider-app"

Create-File (Join-Path $providerApp "package.json") '{
  "name": "provider-app",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.0",
    "socket.io-client": "^4.7.2",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.2.0",
    "vite": "^5.0.0"
  }
}'

Create-File (Join-Path $providerApp "vite.config.js") 'import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"

export default defineConfig({
  plugins: [react()],
  server: { port: 3001 }
})'

Create-File (Join-Path $providerApp "index.html") '<!DOCTYPE html>
<html lang="en"><head><title>UrbanFix - Provider</title></head><body><div id="root"></div><script type="module" src="/src/main.jsx"></script></body></html>'

Create-File (Join-Path $providerApp "src\main.jsx") 'import React from "react";
import ReactDOM from "react-dom/client";
import DashboardScreen from "./screens/DashboardScreen";

ReactDOM.createRoot(document.getElementById("root")).render(<DashboardScreen />);'

Create-File (Join-Path $providerApp "src\screens\DashboardScreen.jsx") '/**
 * TASK: Provider Dashboard & Socket.io Logic
 */
import React, { useState, useEffect } from "react";
import io from "socket.io-client";
import axios from "axios";

export default function DashboardScreen() {
  const [isOnline, setIsOnline] = useState(false);
  const [incomingJob, setIncomingJob] = useState(null);
  
  useEffect(() => {
    // HALF-COMPLETED SOCKET SETUP:
    const socket = io("http://localhost:5000", {
       auth: { token: "TODO: GET_TOKEN_FROM_LOCALSTORAGE" }
    });

    socket.on("connect", () => {
       console.log("Connected to server");
    });

    socket.on("newBooking", (bookingData) => {
       // TODO: Display booking request popup
       setIncomingJob(bookingData);
       // TODO: Start 60 second timer
    });

    return () => socket.disconnect();
  }, []);

  const handleToggleOnline = async () => {
    // TODO: Call API to update status in DB
    // await axios.patch("/api/v1/providers/status", { status: !isOnline ? "ONLINE" : "OFFLINE" });
    setIsOnline(!isOnline);
    
    if (!isOnline) {
       // TODO: Start getting GPS location every 10 seconds and emit via socket
       // navigator.geolocation.watchPosition(pos => {
       //    socket.emit("locationUpdate", { lat: pos.coords.latitude, lng: pos.coords.longitude });
       // });
    }
  };

  const acceptJob = async () => {
    // TODO: Call API to accept booking
    // await axios.patch(`/api/v1/bookings/${incomingJob._id}/accept`);
    setIncomingJob(null);
    // TODO: Navigate to active job screen
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Provider Dashboard</h1>
      
      <button 
        onClick={handleToggleOnline} 
        style={{ padding: "20px", fontSize: "20px", background: isOnline ? "green" : "red", color: "white" }}
      >
        {isOnline ? "GO OFFLINE" : "GO ONLINE"}
      </button>

      {incomingJob && (
        <div style={{ marginTop: "20px", border: "2px solid blue", padding: "20px" }}>
          <h2>🚨 New Job Request!</h2>
          <p>Service: {incomingJob.serviceName}</p>
          <p>Distance: 2.1 KM Away</p>
          <button onClick={acceptJob} style={{ background: "blue", color: "white", padding: "10px" }}>
            Accept Job
          </button>
        </div>
      )}
    </div>
  );
}'


Write-Host "Vite Scaffolding Complete!"
