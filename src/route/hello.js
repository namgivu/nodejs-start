exports.on_get = function (req, resp) {
    let name = req.params.name;
    if (!name) { throw new Error('Param :name is required') }  //TODO handle exception NOT as html content

    return resp
        .status(200)
        .send(`Hello ${name}`)  //TODO make it json instead of str
    ;
};