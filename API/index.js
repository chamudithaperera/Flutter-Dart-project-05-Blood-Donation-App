const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 8500;

// Import DB config
require('./config/db');

// Middleware
app.use(bodyParser.json());

// Import routes
const userRoutes = require('./routes/user.routes');
app.use('/', userRoutes);

app.get('/', (req, res) => {
    res.status(200);
    res.send('HELLO EXPRESS !');
});

app.listen(port, () => {
    console.log('API connect succesfully..');
});