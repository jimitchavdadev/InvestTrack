const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Holding = sequelize.define('Holding', {
    title: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ticker: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    quantity: {
        type: DataTypes.DECIMAL(20, 8),
        allowNull: false,
    },
    purchase_price: {
        type: DataTypes.DECIMAL(20, 2),
        allowNull: false,
    },
    current_price: {
        type: DataTypes.DECIMAL(20, 2),
        allowNull: false,
    },
    asset_type: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    latest_change: {
        type: DataTypes.DECIMAL(20, 2),
        allowNull: false,
    },
}, {
    tableName: 'holdings',
    timestamps: true,
});

module.exports = Holding;