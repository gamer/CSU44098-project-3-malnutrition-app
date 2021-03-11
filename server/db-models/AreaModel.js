const mongoose = require('mongoose');

var Schema = mongoose.Schema;

const AreaSchema = new Schema(
    {
        name: { type: String, required: true },
        members: {type: Schema.Types.ObjectId, ref: 'Patient'},
    },
)

module.exports = mongoose.model('Area', AreaSchema);