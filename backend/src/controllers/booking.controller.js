const Booking = require('../models/booking.model');

exports.createBooking = async (req, res) => {
    /**
     * TASK: Implement createBooking logic
     * 1. Extract serviceId, providerId, addressId, issueDescription from req.body
     * 2. Validate that the inputs are provided
     * 3. Create a new Booking document with status 'PENDING' and req.user._id as customerId
     * 4. Save the booking to MongoDB
     * 5. Access global.io and emit a 'newBooking' socket event to the providerId
     * 6. Return 201 Created with the new booking ID
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.acceptBooking = async (req, res) => {
    /**
     * TASK: Implement acceptBooking logic
     * 1. Extract 'bookingId' from req.params
     * 2. Find the Booking by ID in DB
     * 3. Verify that the current status is 'PENDING'
     * 4. Update the booking status to 'ACCEPTED'
     * 5. Save the updated booking
     * 6. Use global.io to emit 'bookingAccepted' event to the customerId room
     * 7. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.updateBookingStatus = async (req, res) => {
    /**
     * TASK: Implement updateBookingStatus logic
     * 1. Extract 'bookingId' from req.params and 'status' from req.body
     * 2. Validate the status enum (e.g., ON_THE_WAY, STARTED, COMPLETED)
     * 3. Update the booking status in DB
     * 4. Notify customer via Socket.io
     * 5. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

