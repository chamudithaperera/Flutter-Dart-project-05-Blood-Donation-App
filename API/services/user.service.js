const User = require('../models/user.model');

async function createUser(userData) {
  // Check if user already exists
  const existingUser = await User.findOne({ email: userData.email });
  if (existingUser) {
    throw new Error('User already exists');
  }
  // Create and save new user
  const user = new User(userData);
  await user.save();
  return user;
}

// Find user by email and password
async function findUserByEmailAndPassword(email, password) {
  return await User.findOne({ email, password });
}

module.exports = { createUser, findUserByEmailAndPassword }; 