const { User } = require('../models');
const getUser= async (req, res)=>{
    const password= req.body.password;
    const email=req.body.username;
    const user= await User.findOne({ where: { email } });
    if(!user) return res.status(400).send("User not found");
    if (user.password !== password) {
        console.log("invalid password");
        return res.status(400).send("invalid password");
    }
    const { email: userEmail, role } = user;
    res.send({ userEmail, role });
}

module.exports= { getUser }; 