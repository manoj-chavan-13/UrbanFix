import React, { useState, useEffect } from 'react';
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

