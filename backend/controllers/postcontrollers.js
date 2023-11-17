
const { User } = require('../models');

const addUser= async(req, res)=>{
    const {fullname, email, password, role} = req.body;
    console.log(req.body);
   try {
    const user = await User.create({fullname, email, password, role});
    res.status(201).json({
        success: true,
        user
    })
   } catch (error) {
    console.log(error);
    res.status(500).json({
        success: false,
        message: "Internal server error: User not created "
   })
   }
}

module.exports = { addUser }