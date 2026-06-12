/**
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
}
