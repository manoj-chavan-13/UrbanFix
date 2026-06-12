/**
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
}
