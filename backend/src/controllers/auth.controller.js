const User = require('../models/user.model');
const jwt = require('jsonwebtoken');

exports.sendOtp = async (req, res) => {
    /**
     * TASK: Implement sendOtp logic
     * 1. Extract 'phone' from req.body
     * 2. Validate phone number format
     * 3. Generate a 6-digit random OTP
     * 4. Save the OTP to Redis/Database with a 5-minute expiry
     * 5. Call external SMS API to send the OTP
     * 6. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.verifyOtp = async (req, res) => {
    /**
     * TASK: Implement verifyOtp logic
     * 1. Extract 'phone' and 'otp' from req.body
     * 2. Retrieve the stored OTP for this phone from Redis/Database
     * 3. If OTP is invalid or expired, return 400 Error
     * 4. If valid, check if User exists in MongoDB
     * 5. If User doesn't exist, create a new User document
     * 6. Generate a JWT token containing user._id and user.role
     * 7. Return success response with token and user object
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

