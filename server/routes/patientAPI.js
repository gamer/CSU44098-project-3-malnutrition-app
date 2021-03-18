var Patient = require("../db-models/PatientModel.js");
Patient = Patient.Patient
const Area = require("../db-models/AreaModel.js");
var CryptoJS = require("crypto-js");
var config = require('../config');



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
    var tarea = await Area.findOne({ 'name': param.area });
    console.log("tarea:",tarea)
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
    const getPatients = await Patient.find({});
    var patients = getPatients;

    for (var i = 0; i < patients.length; i++) {
        for (var property in patients[i].toJSON()) {
            if(property != "date" && property != "id")
                patients[i][property] = CryptoJS.AES.decrypt(patients[i][property], config.secret).toString(CryptoJS.enc.Utf8)
          }

            }
        
    res.status(200).send(patients);
    return;
}

