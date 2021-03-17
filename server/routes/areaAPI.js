const Area = require("../db-models/AreaModel.js");
var randtoken = require('rand-token');


exports.createArea = async function (req, res) {
    try {
        const area = new Area()
        area.name = req.body.name
        const newArea = await area.save();
        res.status(200).json(newArea);
    }
    catch (err) {
        res.status(400).send({ "error": true, "message": err });
    }
};

/*
{
	{
	"area":"test",
	"username": "test"
    }
}
*/

exports.getAreas = async (req, res) => {
    query = {}
    if(req.body.name)
        query = {name: req.body.name}

    await Area.find(query, (err, Areas) => {
        if (err) {
            return res.status(400).json({ success: false, error: err })
        }
        if (!Areas.length) {
            return res
                .status(404)
                .json({ success: false, error: `No areas found` })
        }
        return res.status(200).json({ success: true, data: Areas.members })
    }).catch(err => console.log(err))
}

