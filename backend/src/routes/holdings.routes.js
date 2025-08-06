const { Router } = require('express');
const { getHoldings } = require('../controllers/holdings.controller');
const authMiddleware = require('../middleware/auth.middleware');

const router = Router();

router.get('/', authMiddleware, getHoldings);

module.exports = router;