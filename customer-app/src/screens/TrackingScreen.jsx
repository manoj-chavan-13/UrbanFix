import React, { useEffect, useState } from 'react';
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

