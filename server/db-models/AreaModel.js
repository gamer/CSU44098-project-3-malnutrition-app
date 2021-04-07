const mongoose = require('mongoose');
const Patient = require("../db-models/PatientModel.js");
var Schema = mongoose.Schema;


const AreaSchema = new Schema(
    {
        name: { type: String, required: true },
        members: [Patient.PatientSchema],
    },
)

module.exports = mongoose.model('Area', AreaSchema);