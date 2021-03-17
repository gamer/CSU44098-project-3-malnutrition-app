const Patient = require("../db-models/PatientModel.js");
const Area = require("../db-models/AreaModel.js");
var CryptoJS = require("crypto-js");
var config = require('../config');
const UserModel = require("../db-models/UserModel.js");
const jwt = require('jsonwebtoken');



// Create new patient 
exports.newPatient = async function (req, res) {
    let param = req.body;

    // Encrypt patient data before adding it to the db (Just to say we considered it, obviously not effective)
    var cipher_name = CryptoJS.AES.encrypt(JSON.stringify(param.name), config.secret).toString();
    var cipher_age = CryptoJS.AES.encrypt(JSON.stringify(param.age), config.secret).toString();
    var cipher_weight = CryptoJS.AES.encrypt(JSON.stringify(param.weight), config.secret).toString();
    var cipher_height = CryptoJS.AES.encrypt(JSON.stringify(param.height), config.secret).toString();

    var post = new Patient({
        name: cipher_name,
        age: cipher_age,
        height:cipher_height,
        weight: cipher_weight,
        date: Date.now()
    });

    const newPatient = await post.save();

    // Add patient to area (if doesn't exist, create)
    let tarea = await Area.findOne({ 'name': param.area });

    try {
        if(tarea == null){
            tarea = new Area()
            tarea.name = param.area
        }

        tarea.members.push(newPatient);
        const updatedArea = await tarea.save();
        res.status(200).json(updatedArea);
    }
    catch (err) {
        res.status(400).send(tarea);
};
}

// Get all patients
exports.getPatients = async function (req, res) {
    let param = req.body;
    const getPatients = await Patient.find({});
    var patients = getPatients;

    for (var i = 0; i < patients.length; i++) {
            var key = config.secret
            var decryptedPatient = {
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

