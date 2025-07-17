const { createUser, findUserByEmailAndPassword } = require('../services/user.service');

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

// Login controller
async function loginUser(req, res) {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required.' });
    }
    const user = await findUserByEmailAndPassword(email, password);
    if (!user) {
      return res.status(401).json({ message: 'Invalid email or password.' });
    }
    res.status(200).json({ message: 'Login successful', user });
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
}

module.exports = { registerUser, loginUser }; 