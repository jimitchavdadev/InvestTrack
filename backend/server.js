const express = require('express');
const sequelize = require('./src/config/database');
const authRoutes = require('./src/routes/auth.routes');
const holdingRoutes = require('./src/routes/holdings.routes');
const transactionRoutes = require('./src/routes/transactions.routes');

const User = require('./src/models/user.model');
const Holding = require('./src/models/holding.model');
const Transaction = require('./src/models/transaction.model');

const app = express();
const PORT = process.env.PORT || 3000;

// Associate models
User.hasMany(Holding, { foreignKey: 'user_id', onDelete: 'CASCADE' });
Holding.belongsTo(User, { foreignKey: 'user_id' });

User.hasMany(Transaction, { foreignKey: 'user_id', onDelete: 'CASCADE' });
Transaction.belongsTo(User, { foreignKey: 'user_id' });

app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/holdings', holdingRoutes);
app.use('/api/transactions', transactionRoutes);

sequelize.sync({ alter: true }).then(() => {
    console.log('Database synced successfully.');
    app.listen(PORT, () => {
        console.log(`Server is running on http://localhost:${PORT}`);
    });
}).catch(error => {
    console.error('Unable to sync database:', error);
});