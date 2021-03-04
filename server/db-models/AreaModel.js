const mongoose = require('mongoose');

var Schema = mongoose.Schema;

const AreaSchema = new Schema(
    {
        name: { type: String, required: true },
        members: { type: [String] },
    },
)

module.exports = mongoose.model('AreaModel', AreaSchema);