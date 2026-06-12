/**
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

