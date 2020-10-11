const express = require('express');
const port = process.env.PORT || 8080;
const app = express();
app.use('/static', express.static(__dirname + '/public'));
app.listen(port);