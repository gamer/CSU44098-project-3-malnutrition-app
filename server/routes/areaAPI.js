const { json } = require("express");
const Area = require("../db-models/AreaModel.js");
var CryptoJS = require("crypto-js");
var config = require('../config');

// Create a new area without assigning any patients. Can also just create by enterring unique on patient entry.
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



// Get an area {name: "areaName"} or get all areas {}
exports.getAreas = async (req, res) => {
    query = {}
    if(req.body.name)
        query = {name: req.body.name}

    await Area.find(query, (err, Areas) => {
        if (err) {
            return res.status(400).json({ success: false, error: "Area not found."})
        }
        for (var i = 0; i < Areas.length; i++) {
            for (var j = 0; j < Areas[i].members.length; j++) {
                for (var property in Areas[i].members[j].toJSON()) {
                    if(property != "date" && property != "id")
                        console.log(property)
                        Areas[i].members[j][property] = CryptoJS.AES.decrypt(Areas[i].members[j][property], config.secret).toString(CryptoJS.enc.Utf8)
                  }
            }  
        }
        return res.status(200).json({ success: true, data: area})
    }).catch(err => console.log(err))
}

