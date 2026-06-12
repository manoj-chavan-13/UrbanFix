const Provider = require('../models/provider.model');

exports.getNearbyProviders = async (req, res) => {
    /**
     * TASK: Implement getNearbyProviders using GeoSearch
     * 1. Extract 'lat', 'lng', 'radius', 'serviceId' from req.query
     * 2. Validate coordinates are present
     * 3. Query the ProviderLocations collection using MongoDB $near operator
     * 4. Populate the Provider details from the related model
     * 5. Filter the results by serviceId, isApproved: true, and status: 'ONLINE'
     * 6. Return sorted array of providers to the client
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

exports.toggleAvailability = async (req, res) => {
    /**
     * TASK: Implement toggleAvailability
     * 1. Extract 'status' (ONLINE/OFFLINE) from req.body
     * 2. Find the provider document using req.user._id
     * 3. Update the provider's status field
     * 4. Return success response
     */
    try {
        // User to implement logic here
    } catch (error) {
        // User to implement error handling
    }
};

