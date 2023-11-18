const express=require('express')
const router=express.Router()

const { addUser, addProperty } = require('../controllers/postcontrollers');
const { getUser, getProperties, getUsers, getPropertiesbyId } = require('../controllers/getcontrollers');


router.post('/register',addUser)
router.post('/addproperty',addProperty)

router.post('/login', getUser)
router.get('/getproperties', getProperties)
router.get('/getusers', getUsers)
router.get('/getpropertiesbyid/:id', getPropertiesbyId)


module.exports=router;

