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

PatientSchema.options.toJSON = {
    transform: function(doc, ret, options) {
        ret.id = ret._id;
        delete ret._id;
        delete ret.__v;
        return ret;
    }
};

module.exports = {
    Patient: mongoose.model('Patient', PatientSchema),
    PatientSchema: PatientSchema
}
