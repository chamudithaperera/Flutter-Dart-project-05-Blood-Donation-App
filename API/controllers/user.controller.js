const { createUser } = require('../services/user.service');

async function registerUser(req, res) {
  try {
    const { name, email, password, bloodGroup, phone, address } = req.body;
    if (!name || !email || !password || !address) {
      return res.status(400).json({ message: 'Name, email, password, and address are required.' });
    }
    await createUser({ name, email, password, bloodGroup, phone, address });
    res.status(201).json({ message: 'User registered successfully.' });
  } catch (error) {
    if (error.message === 'User already exists') {
      return res.status(409).json({ message: error.message });
    }
    res.status(500).json({ message: 'Server error', error: error.message });
  }
}

module.exports = { registerUser }; 