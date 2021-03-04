const PatientModel = require("../db-models/PatientModel.js");
const AreaModel = require("../db-models/AreaModel.js");
var CryptoJS = require("crypto-js");
var config = require('../config');
const UserModel = require("../db-models/UserModel.js");
const jwt = require('jsonwebtoken');

async function getArea(area) {
    var g = await AreaModel.find({ name: area }, (err, Areas) => {
        if (err) {
            return (0)
        }
        if (!Areas.length) {
            return (0)
        }
        return Areas
    }).catch(err => console.log(err))
    return g;
}

// Create new patient 
exports.newPatient = async function (req, res) {
    let param = req.body;
    var token = param.token;
    // Verify token
    if (!token) return res.status(401).send({ auth: false, message: 'No token provided.' });
    jwt.verify(token, config.secret, function(err, decoded) {
        if (err) return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
        if(UserModel.findById(decoded)==[]) return res.status(500).send({ auth: false, message: 'Token expired/invalid.' });
        return
    });


    // Encrypt patient data before adding it to the db (Just to say we considered it, obviously not effective)
    var cipher_name = CryptoJS.AES.encrypt(JSON.stringify(param.name), config.secret).toString();
    var cipher_age = CryptoJS.AES.encrypt(JSON.stringify(param.age), config.secret).toString();
    var cipher_weight = CryptoJS.AES.encrypt(JSON.stringify(param.weight), config.secret).toString();
    var cipher_height = CryptoJS.AES.encrypt(JSON.stringify(param.height), config.secret).toString();

    var post = new PostModel({
        area_name: param.area,
        addedBy: param.addedBy,
        name: cipher_name,
        age: cipher_age,
        height:cipher_height,
        weight: cipher_weight,
        date: Date.now()
    });
    const newPatient = await post.save();
    if (newPatient != post) {
        res.send(400).json("Error");
    }
    res.send(200).json(newPatient);
};



//Get area name -> use key to decrypt
exports.getPatients = async function (req, res) {
    let param = req.body;
    var token = param.token;

    // Verify token
    if (!token) return res.status(401).send({ auth: false, message: 'No token provided.' });
    jwt.verify(token, config.secret, function(err, decoded) {
        if (err) return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
        if(UserModel.findById(decoded)==[]) return res.status(500).send({ auth: false, message: 'Token expired/invalid.' });
        return
    });


    // Get all patient data
    if(param.area){
        const getPatients = await PatientModel.find(req.body.area);
        var patients = getPatients;
    }
    else{
        const getPatients = await PatientModel.find({});
        var patients = getPatients;
    }

    for (var i = 0; i < patients.length; i++) {
            var key = config.secret
            var decryptedPatient = {
                area_name: patients[i].area,
                addedBy: patients[i].addedBy,
                name: CryptoJS.AES.decrypt(patients[i].name, key).toString(CryptoJS.enc.Utf8),
                age: CryptoJS.AES.decrypt(patients[i].age, key).toString(CryptoJS.enc.Utf8),
                height:CryptoJS.AES.decrypt(patients[i].weight, key).toString(CryptoJS.enc.Utf8),
                weight: CryptoJS.AES.decrypt(patients[i].height, key).toString(CryptoJS.enc.Utf8),
                date: patients[i].date
            }
            patients[i] = decryptedPatient;
        }
    res.status(200).send(patients);
    return;
}

