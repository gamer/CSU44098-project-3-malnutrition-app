const mongoose = require('mongoose');

var Schema = mongoose.Schema;

var PatientSchema = new Schema({
    area_name: {
        type: String, required: true
    },
    addedBy: {
        type: String, required: true
    },
    name: {
        type: String, required: true
    },
    age: {
        type: String, required: true
    },
    height: {
        type: String, required: true
    },
    weight: {
        type: String, required: true
    },
    date: { type: Date, default: Date.now }
});


module.exports = mongoose.model('PatientModel', PatientSchema);