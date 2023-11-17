const express=require('express')
const router=express.Router()

const { addUser } = require('../controllers/postcontrollers');
const { getUser } = require('../controllers/getcontrollers');


router.post('/register',addUser)

router.get('/login',getUser)

module.exports=router;

