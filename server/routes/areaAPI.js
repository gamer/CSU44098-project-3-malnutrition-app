const AreaModel = require("../db-models/AreaModel.js");
var randtoken = require('rand-token');
/*
{
	"area":"locationName",
	"members": ["mem1","mem2","mem3"]
}
*/
exports.createArea = async function (req, res) {
    var params = req.body
    try {
        const area = new AreaModel({
            name: params.name,
            members: [],
        });

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

exports.addMember = async function (req, res) {
    let params = req.body;
    let tarea = await AreaModel.findOne({ 'name': params.area });

    try {

        tarea.members.push(params.username);
        const updatedArea = await tarea.save();
        res.status(200).json(updatedArea);
    }
    catch (err) {
        res.status(400).send({ "error": true, "message": err });
    }
};


exports.areaByUser = async (req, res) => {
    await AreaModel.find({ members: req.params.name }, (err, Area) => {
        if (err) {
            return res.status(400).json({ success: false, error: "err" })
        }
        if (!Area) {
            return res.status(404).json({ success: false, error: `Area not found` })
        }
        var areas = [];
        for (i = 0; i < Area.length; i++) {
            console.log(Area[i].name)
            areas.push(Area[i].name)
        }
        res.status(200).json(areas);
    }).catch(err => console.log(err));
}


exports.getAreas = async (req, res) => {
    await AreaModel.find({}, (err, Areas) => {
        if (err) {
            return res.status(400).json({ success: false, error: err })
        }
        if (!Areas.length) {
            return res
                .status(404)
                .json({ success: false, error: `Area not found` })
        }
        return res.status(200).json({ success: true, data: Areas })
    }).catch(err => console.log(err))
}

exports.getArea = async (req, res) => {
    await AreaModel.find({ name: req.params.name }, (err, Areas) => {
        if (err) {
            res(0)
        }
        if (!Areas.length) {
            res(0)
        }
        res.send(Areas);
    }).catch(err => console.log(err))
}

