const { User, Properties } = require('../models');
const getUser= async (req, res)=>{
    const password= req.body.password;
    const email=req.body.username;
    console.log(password);
    console.log(email);
    const user= await User.findOne({ where: { email } });
    console.log(user);
    if(!user) return res.status(400).send("User not found");
    if (user.password !== password) {
        console.log("invalid password");
        return res.status(400).send("invalid password");
    }
    const { fullname, email: userEmail, role,  id } = user;
    console.log("login successful");
    res.send({ fullname, userEmail, role, id });
}

const getProperties= async (req, res)=>{
   try {
    const properties= await Properties.findAll();
    res.status(200).json({
        success: true,
        properties
    })
   } catch (error) {
    console.log(error);
    res.status(500).json({
        success: false,
        message: "Internal server error: properties not found: "+ error.message
   })
}
}

const getUsers= async (req, res)=>{
    try {
     const users= await User.findAll();
     res.status(200).json({
         success: true,
         users,
     })
    } catch (error) {
     console.log(error);
     res.status(500).json({
         success: false,
         message: "Internal server error: users not found: "+ error.message
    })
 }
}

const getPropertiesbyId= async (req, res)=>{
    console.log(req.params.id);
    try {
     const properties= await Properties.findAll({where:{userID :req.params.id}});
     res.status(200).json({
         success: true,
         properties
     })
     console.log("property ");
    } catch (error) {
     console.log(error);
     res.status(500).json({
         success: false,
         message: "Internal server error: properties not found: "+ error.message
    })
 }
}

module.exports= { getUser, getProperties, getUsers, getPropertiesbyId }; 