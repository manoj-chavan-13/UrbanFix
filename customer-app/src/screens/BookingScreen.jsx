import React, { useState } from 'react';
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

