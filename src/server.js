const express = require('express')

const health        = require('./route/health')
const hello         = require('./route/hello')
const hello_w_param = require('./route/hello_w_param')


let app = express()

let port = process.env.PORT || 3000  // listen at envvar port :PORT - default as 3000
app.listen(port)

//region register the route
app.route('/health').get(health.on_get)

app.route('/hello'      ).get(hello.on_get)
app.route('/hello/'     ).get(hello.on_get)
app.route('/hello/:name').get(hello_w_param.on_get)
//endregion register the route


// print ready
console.log(`api server started at port=${port}`)
