/**
 * TASK: Server Entry Point & Socket Connection
 */
require("dotenv").config();
const http = require("http");
const app = require("./app");
const { Server } = require("socket.io");
const mongoose = require("mongoose");

const PORT = process.env.PORT || 5000;
const server = http.createServer(app);

// HALF COMPLETED SOCKET SERVER
const io = new Server(server, {
    cors: { origin: "*", methods: ["GET", "POST", "PATCH"] }
});

// Make IO globally accessible to controllers
global.io = io;

io.on("connection", (socket) => {
    console.log("New client connected", socket.id);
    
    // TASK: Handle location updates from providers
    socket.on("locationUpdate", (data) => {
        // TODO: Update provider location in DB
        // TODO: Broadcast to specific customer room if in active booking
        // io.to(`booking_${data.bookingId}`).emit("providerLocationUpdate", data.coords);
    });

    socket.on("disconnect", () => console.log("Client disconnected"));
});

// HALF COMPLETED DB CONNECTION
/*
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("MongoDB Connected");
        server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
    })
    .catch(err => console.error("DB Connection Error:", err));
*/

