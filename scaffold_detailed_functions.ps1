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
# BACKEND CONTROLLERS
# ==========================================
$backend = Join-Path $rootDir "backend"

Create-File (Join-Path $backend "src\controllers\auth.controller.js") "const User = require('../models/user.model');
const jwt = require('jsonwebtoken');

exports.sendOtp = async (req, res) => {
    /**
     * TASK: Implement sendOtp logic
     * 1. Extract 'phone' from req.body
     * 2. Validate phone number format
     * 3. Generate a 6-digit random OTP
     * 4. Save the OTP to Redis/Database with a 5-minute expiry
     * 5. Call external SMS API to send the OTP
     * 6. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.verifyOtp = async (req, res) => {
    /**
     * TASK: Implement verifyOtp logic
     * 1. Extract 'phone' and 'otp' from req.body
     * 2. Retrieve the stored OTP for this phone from Redis/Database
     * 3. If OTP is invalid or expired, return 400 Error
     * 4. If valid, check if User exists in MongoDB
     * 5. If User doesn't exist, create a new User document
     * 6. Generate a JWT token containing user._id and user.role
     * 7. Return success response with token and user object
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};
"

Create-File (Join-Path $backend "src\controllers\booking.controller.js") "const Booking = require('../models/booking.model');

exports.createBooking = async (req, res) => {
    /**
     * TASK: Implement createBooking logic
     * 1. Extract serviceId, providerId, addressId, issueDescription from req.body
     * 2. Validate that the inputs are provided
     * 3. Create a new Booking document with status 'PENDING' and req.user._id as customerId
     * 4. Save the booking to MongoDB
     * 5. Access global.io and emit a 'newBooking' socket event to the providerId
     * 6. Return 201 Created with the new booking ID
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.acceptBooking = async (req, res) => {
    /**
     * TASK: Implement acceptBooking logic
     * 1. Extract 'bookingId' from req.params
     * 2. Find the Booking by ID in DB
     * 3. Verify that the current status is 'PENDING'
     * 4. Update the booking status to 'ACCEPTED'
     * 5. Save the updated booking
     * 6. Use global.io to emit 'bookingAccepted' event to the customerId room
     * 7. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.updateBookingStatus = async (req, res) => {
    /**
     * TASK: Implement updateBookingStatus logic
     * 1. Extract 'bookingId' from req.params and 'status' from req.body
     * 2. Validate the status enum (e.g., ON_THE_WAY, STARTED, COMPLETED)
     * 3. Update the booking status in DB
     * 4. Notify customer via Socket.io
     * 5. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};
"

Create-File (Join-Path $backend "src\controllers\provider.controller.js") "const Provider = require('../models/provider.model');

exports.getNearbyProviders = async (req, res) => {
    /**
     * TASK: Implement getNearbyProviders using GeoSearch
     * 1. Extract 'lat', 'lng', 'radius', 'serviceId' from req.query
     * 2. Validate coordinates are present
     * 3. Query the ProviderLocations collection using MongoDB `$near` operator
     * 4. Populate the Provider details from the related model
     * 5. Filter the results by serviceId, isApproved: true, and status: 'ONLINE'
     * 6. Return sorted array of providers to the client
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.toggleAvailability = async (req, res) => {
    /**
     * TASK: Implement toggleAvailability
     * 1. Extract 'status' (ONLINE/OFFLINE) from req.body
     * 2. Find the provider document using req.user._id
     * 3. Update the provider's status field
     * 4. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};
"

# ==========================================
# CUSTOMER APP SCREENS
# ==========================================
$customerApp = Join-Path $rootDir "customer-app"

Create-File (Join-Path $customerApp "src\screens\HomeScreen.jsx") "import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

export default function HomeScreen() {
    const [categories, setCategories] = useState([]);
    const [nearbyProviders, setNearbyProviders] = useState([]);
    const navigate = useNavigate();

    useEffect(() => {
        /**
         * TASK: Initialization
         * 1. Call fetchCategories() to load master data
         * 2. Call getUserLocation() to get GPS and fetch providers
         */
    }, []);

    const fetchCategories = async () => {
        /**
         * TASK: Fetch Service Categories
         * 1. Execute GET request to '/api/v1/categories'
         * 2. Update 'categories' state with the response array
         * 3. Catch and log errors
         */
    };

    const getUserLocation = () => {
        /**
         * TASK: Get Browser Geolocation
         * 1. Use navigator.geolocation.getCurrentPosition
         * 2. On success, extract latitude and longitude
         * 3. Pass coords to fetchNearbyProviders(lat, lng)
         */
    };

    const fetchNearbyProviders = async (lat, lng) => {
        /**
         * TASK: Fetch Nearby Providers via API
         * 1. Execute GET request to '/api/v1/providers/nearby?lat=...&lng=...'
         * 2. Update 'nearbyProviders' state with the result
         */
    };

    const navigateToCategory = (categoryId) => {
        /**
         * TASK: Handle category click
         * 1. Navigate user to '/providers?category=categoryId'
         */
    };

    return (
        <div className='home-container'>
            <header><h1>UrbanFix</h1></header>
            
            <section className='categories'>
                <h2>Services</h2>
                {/* User to map categories to UI elements here */}
            </section>
            
            <section className='nearby'>
                <h2>Nearby Professionals</h2>
                {/* User to map nearbyProviders to Provider Cards here */}
            </section>
        </div>
    );
}
"

Create-File (Join-Path $customerApp "src\screens\BookingScreen.jsx") "import React, { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';

export default function BookingScreen() {
    const { providerId } = useParams();
    const navigate = useNavigate();
    const [issueDescription, setIssueDescription] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const handleFormSubmit = async (e) => {
        /**
         * TASK: Handle Form Submission
         * 1. Prevent default event behavior
         * 2. Call executeBookingApi()
         */
    };

    const executeBookingApi = async () => {
        /**
         * TASK: Execute POST request to create booking
         * 1. Set isLoading to true
         * 2. Send POST to '/api/v1/bookings/create' with providerId and issueDescription
         * 3. If successful, navigate to '/track/{bookingId}'
         * 4. Catch errors and display alert
         * 5. Set isLoading to false
         */
    };

    return (
        <div className='booking-container'>
            <h1>Confirm Booking</h1>
            {/* User to implement form inputs and submit button here */}
        </div>
    );
}
"

Create-File (Join-Path $customerApp "src\screens\TrackingScreen.jsx") "import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import io from 'socket.io-client';

export default function TrackingScreen() {
    const { bookingId } = useParams();
    const [bookingStatus, setBookingStatus] = useState('PENDING');
    const [providerCoords, setProviderCoords] = useState(null);

    useEffect(() => {
        /**
         * TASK: Initialize Socket.io connection
         * 1. Connect to backend socket server
         * 2. Emit event to join a room specific to 'bookingId'
         * 3. Call setupSocketListeners(socket)
         * 4. Return cleanup function to disconnect socket on unmount
         */
    }, [bookingId]);

    const setupSocketListeners = (socket) => {
        /**
         * TASK: Set up socket event listeners
         * 1. Listen for 'bookingStatusUpdated' -> update bookingStatus state
         * 2. Listen for 'providerLocationUpdate' -> update providerCoords state
         */
    };

    return (
        <div className='tracking-container'>
            <h1>Live Tracking</h1>
            {/* User to implement Status display and Google Map showing providerCoords here */}
        </div>
    );
}
"

# ==========================================
# PROVIDER APP SCREENS
# ==========================================
$providerApp = Join-Path $rootDir "provider-app"

Create-File (Join-Path $providerApp "src\screens\DashboardScreen.jsx") "import React, { useState, useEffect } from 'react';
import io from 'socket.io-client';
import axios from 'axios';

export default function DashboardScreen() {
    const [isOnline, setIsOnline] = useState(false);
    const [incomingJob, setIncomingJob] = useState(null);
    const [socketInstance, setSocketInstance] = useState(null);

    useEffect(() => {
        /**
         * TASK: Setup Provider Socket.io
         * 1. Connect socket and save instance to state
         * 2. Listen for 'newBooking' event and call handleIncomingJob(jobData)
         * 3. Disconnect socket on unmount
         */
    }, []);

    const handleIncomingJob = (jobData) => {
        /**
         * TASK: Handle new job alert
         * 1. Set the incomingJob state
         * 2. Start a 60-second timeout. If not accepted in 60s, set incomingJob to null
         */
    };

    const toggleOnlineStatus = async () => {
        /**
         * TASK: Toggle Online/Offline DB status
         * 1. Send PATCH to '/api/v1/providers/status'
         * 2. Update isOnline state
         * 3. If turning ONLINE, call startLocationBroadcast()
         * 4. If turning OFFLINE, call stopLocationBroadcast()
         */
    };

    const startLocationBroadcast = () => {
        /**
         * TASK: Emit GPS live data
         * 1. Use navigator.geolocation.watchPosition
         * 2. Inside callback, emit 'locationUpdate' event via socketInstance
         * 3. Save watch ID to cancel later
         */
    };

    const acceptJob = async () => {
        /**
         * TASK: Accept the booking
         * 1. Execute PATCH to '/api/v1/bookings/{incomingJob._id}/accept'
         * 2. Clear incomingJob state
         * 3. Navigate to JobDetailsScreen
         */
    };

    return (
        <div className='dashboard-container'>
            <h1>Dashboard</h1>
            {/* User to implement Go Online Button and Incoming Job UI Popup here */}
        </div>
    );
}
"

Write-Host "Detailed Function Scaffolding Complete!"
