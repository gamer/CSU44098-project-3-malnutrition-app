const UserModel = require("../db-models/UserModel.js");
const jwt = require('jsonwebtoken');
var config = require('../config');

exports.login = async function (req, res) {
    // Fetching user and test password verification
    UserModel.findOne({ username: req.body.username }, function (err, user) {
        if (err || !user) {
            res.status(200).json(false);
        }
        else {
            user.comparePassword(req.body.password, function (err, isMatch) {
                if (err) {
                    res.status(400).json(err);
                }
                else{
                // Create token that will expire in 20 minutes
                var token = jwt.sign({ id: user._id }, config.secret, {
                    expiresIn: 1500
                });
                res.send(token)
                }
            });
        }
    });
}

exports.addUser = async function (req, res) {
    let param = req.body;
    var testUser = new UserModel({
        username: param.username,
        password: param.password,
    });

    const newUser = await testUser.save();
    res.status(200).json(newUser);
};



