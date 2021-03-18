const User = require("../db-models/UserModel.js");

exports.login = async function (req, res) {
    // Fetching user and test password verification
    User.findOne({ username: req.body.username }, function (err, user) {
        if (err || !user) {
            res.status(200).json(false);
        }
        else {
            user.comparePassword(req.body.password, function (err, isMatch) {
                if (err) {
                    res.status(400).json(err);
                }
                else{
                res.send(200)
                }
            });
        }
    });
}

// Register / Create user
exports.addUser = async function (req, res) {
    let param = req.body;
    var testUser = new User({
        username: param.username,
        password: param.password,
    });

    const newUser = await testUser.save();
    res.status(200).json(newUser);
};



