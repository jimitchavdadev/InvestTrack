const Holding = require('../models/holding.model');

exports.getHoldings = async (req, res) => {
    const userId = req.user.id; // User ID from the JWT token

    try {
        const holdings = await Holding.findAll({
            where: { user_id: userId },
            attributes: ['id', 'title', 'ticker', 'quantity', 'purchase_price', 'current_price', 'asset_type', 'latest_change'],
        });

        res.status(200).json(holdings);
    } catch (error) {
        console.error('Error fetching holdings:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};