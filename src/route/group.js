const pg = require('pg')

const pool = new pg.Pool({
    'user'     : 'nodejs_start_dbuser20909',
    'password' : 'nodejs_start_dbpass20909',
    'port'     : 20908,
    'database' : 'nodejs_start_dbname20909',
})

exports.on_get = (req, resp) => {
    resp.status(200).json({})
}
