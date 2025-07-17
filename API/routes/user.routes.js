const express = require('express');
const router = express.Router();
const { registerUser, loginUser, getUserByEmail } = require('../controllers/user.controller');

router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/user', getUserByEmail);

module.exports = router; 