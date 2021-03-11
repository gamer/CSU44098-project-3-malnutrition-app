const mongoose = require('mongoose');

var Schema = mongoose.Schema;

var PatientSchema = new Schema({
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


module.exports = mongoose.model('Patient', PatientSchema);