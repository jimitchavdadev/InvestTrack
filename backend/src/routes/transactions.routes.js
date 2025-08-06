const { Router } = require('express');
const { addTransaction } = require('../controllers/transactions.controller');
const authMiddleware = require('../middleware/auth.middleware');

const router = Router();

router.post('/add', authMiddleware, addTransaction);

module.exports = router;