/**
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

