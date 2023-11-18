
const { User, Properties } = require('../models');

const addUser= async(req, res)=>{
console.log("called");
    const {fullname, email, password, role} = req.body;
    console.log(req.body);
   try {
    const user = await User.create({fullname, email, password, role});
    res.status(200).json({
        success: true,
        user
    })
    console.log("user created successfully");
   } catch (error) {
    console.log(error);
    res.status(500).json({
        success: false,
        message: "Internal server error: User not created: "+ error.message
   })
   }
}


const addProperty= async(req, res)=>{
    const {propertyName, location, description, price, contact, userID} = req.body;
    console.log(userID);
   try {
    const user = await User.findByPk(userID);
    if (!user || user.role !== 'LANDLORD') {
      console.log('User is not authorized to add a property. Must be a landlord.');
      return res.status(403).json({
        success: false,
        message: "User is not authorized to add a property. Must be a landlord."
      });
    }
    const property = await Properties.create({propertyName, location, description, price, contact, userID});
    console.log("property created successfully");
    res.status(200).json({
        success: true,
        property,
        message: "property created successfully"
    })
   } catch (error) {
    console.log(error);
    res.status(500).json({
        success: false,
        message: "Internal server error: property not added: "+ error.message
   })
   } 
}


module.exports = { addUser, addProperty }