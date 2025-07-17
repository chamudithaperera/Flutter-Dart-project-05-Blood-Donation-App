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

module.exports = { createUser }; 