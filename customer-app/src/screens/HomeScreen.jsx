import React, { useState, useEffect } from 'react';
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

