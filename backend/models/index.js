const sequelize= require('sequelize')
const db= require('../utils')

const User=db.define('tenant',{
    fullname:{
        type:sequelize.STRING,
        allowNull:false,
        validate:{
            notEmpty:{
                msg:"Full Name is required"
            }
        }
    },
    email:{
        type:sequelize.STRING,
        allowNull:false,
        validate:{
            notEmpty:{
                msg:"Email is required"
            }
        },
    },
    role:{
        type:sequelize.ENUM("LANDLORD", "TENANT"),
        allowNull:false,
        validate:{
            notEmpty:{
                msg:"Role is required"
            }
        }
    },
    password:{
        type:sequelize.STRING,
        allowNull:false,
        validate:{
            notEmpty:{
                msg:"Password is required"
            }
        }
    }

})


const Properties=db.define('properties',{
    propertyName:{
        type:sequelize.STRING,
        allowNull:false,
        validate:{
            notEmpty:{
                msg:"Property Name is required"
            }
        },
        description:{
            type:sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:{
                    msg:"Description is required"
                }
            }
        },
        location:{
            type:sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:{
                    msg:"Location is required"
                }
            }
        },
        contanct:{
            type:sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:{
                    msg:"Contact is required"
                }
            }
        },
        price:{
            type:sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:{
                    msg:"Price is required"
                }
            }
        }
    }
})

module.exports={ User };