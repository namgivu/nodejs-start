const express = require('express');
const health = require('./route/health');


let app = express();

// listen at port :PORT - default as 3000
let port = process.env.PORT || 3000;
app.listen(port);

// register the route(s)
app.route('/health').get(health.on_get);

console.log(`api server started at port=${port}`);
