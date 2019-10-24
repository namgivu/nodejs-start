exports.on_get = function (req, resp) {
    let name = req.params.name;
    if (!name) { throw new Error('Param :name is required') }

    return resp
        .status(200)
        .send(`Hello ${name}`)
    ;
};