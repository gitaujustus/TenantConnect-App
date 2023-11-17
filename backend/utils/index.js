const sequelize= require('sequelize')

const db=new sequelize('tenantconnect','postgres','drowssap',{
    host:'localhost',
    dialect:'postgres'
})

module.exports=db 