const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Transaction = sequelize.define('Transaction', {
    ticker: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    quantity: {
        type: DataTypes.DECIMAL(20, 8),
        allowNull: false,
    },
    price: {
        type: DataTypes.DECIMAL(20, 2),
        allowNull: false,
    },
    transaction_type: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    transaction_date: {
        type: DataTypes.DATE,
        allowNull: false,
    },
}, {
    tableName: 'transactions',
});

module.exports = Transaction;