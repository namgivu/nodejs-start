const pg = require('pg')

exports.pool = new pg.Pool({
    'user'     : 'nodejs_start_dbuser20909',
    'password' : 'nodejs_start_dbpass20909',
    'port'     : 20908,
    'database' : 'nodejs_start_dbname20909',
})
