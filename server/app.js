const express = require('express')
const cors = require('cors')
require('dotenv').config()
var router = express.Router();
var user_controller = require("./routes/userAPI");
var patient_controller = require("./routes/patientAPI");
var area_controller = require("./routes/areaAPI");
var testAPIRouter = require("./routes/tests/testAPI");
var testDBRouter = require("./routes/tests/testDB");

const app = express()
const mongoose = require('mongoose');
mongoose.connect("mongodb://user:password@db:27017/db", { useNewUrlParser: true });


app.use(cors());
app.use(express.json());
app.use(require("body-parser").json())

app.get('/', (req, res) => {
    res.status(200).send("Hey");
});


// Test Routes - Server and DB
router.use('/test', testAPIRouter);
router.use("/testDB", testDBRouter);


// Login / Register
router.get('/user/', user_controller.login);
router.post('/user/', user_controller.addUser);

// Get all patients 
router.get('/patients', patient_controller.getPatients);
// New Patient {body: {area: "areaName", addedBy: "user",  patientName: "Bob", age: "14", weight: "16", height: "16"} }
router.post('/patients', patient_controller.newPatient);


// Get all locations/areas
router.get('/area', area_controller.getAreas);
// Create area
router.post('/area', area_controller.createArea);


app.use('/api', router);

// Route not found
app.use(function (req, res, next) {
    res.status(404).send('Not found');
});

app.listen(process.env.SERVER_PORT, () => console.log('Server started on ' + process.env.SERVER_PORT));
exports.app = app;
