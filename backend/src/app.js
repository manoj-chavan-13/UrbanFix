/**
 * TASK: Express App Middleware & Routes
 */
const express = require("express");
const cors = require("cors");
// const authRoutes = require("./routes/auth.routes");
// const bookingRoutes = require("./routes/booking.routes");

const app = express();

app.use(cors());
app.use(express.json());

// HALF COMPLETED ROUTE MOUNTING
// app.use("/api/v1/auth", authRoutes);
// app.use("/api/v1/bookings", bookingRoutes);

// Global Error Handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ success: false, message: err.message });
});

module.exports = app;

