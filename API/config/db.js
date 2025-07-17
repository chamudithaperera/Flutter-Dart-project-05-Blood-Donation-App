const mongoose = require('mongoose');

const mongoURI = 'mongodb://localhost:27017/BloodDonationDB';

mongoose.connect(mongoURI);

const db = mongoose.connection;
db.on('error', (err) => {
  console.error('MongoDB connection error:', err);
});
db.once('open', () => {
  console.log('Connected to MongoDB');
});

module.exports = db; 