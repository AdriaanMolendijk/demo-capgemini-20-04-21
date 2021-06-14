const express = require('express');
const app = express();
const path = require('path');
const port = 8080; // default port to listen

// Parsers for POST data

// Point static path to dist
app.use(express.static(path.join(__dirname, './www')));

// health check
app.get('/health', function (req, res) {
    return res.json({status: 'UP'});
});

// Catch all other routes and return the index file
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, './www/index.html'));
});

// start the Express server
app.listen(port, () => {
    console.log(`server started at http://localhost:${port}`);
});
