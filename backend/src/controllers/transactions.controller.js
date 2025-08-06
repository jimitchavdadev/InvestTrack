const Transaction = require('../models/transaction.model');

exports.addTransaction = async (req, res) => {
    const { ticker, quantity, price, transaction_type, transaction_date } = req.body;
    const userId = req.user.id;

    if (!ticker || !quantity || !price || !transaction_type || !transaction_date) {
        return res.status(400).json({ message: 'All fields are required' });
    }

    try {
        const newTransaction = await Transaction.create({
            user_id: userId,
            ticker: ticker,
            quantity: quantity,
            price: price,
            transaction_type: transaction_type,
            transaction_date: transaction_date,
        });

        res.status(201).json({ message: 'Transaction added successfully', transaction: newTransaction });
    } catch (error) {
        console.error('Error adding transaction:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
};