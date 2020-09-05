const PostgresSvc = require('../service/postgres')
const pool = PostgresSvc.pool

exports.on_get = (req, resp) => {
    sql=`select * from "Groups"`
    pool.query(sql, (err, r) => {
        if (err) { throw err }
        resp.status(200).json(r.rows)
    })
}
