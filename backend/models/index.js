const sequelize= require('sequelize')
const db= require('../utils')

const User=db.define('user',{
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
        unique: {
            msg: 'Email must be unique'
          },
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
        contact:{
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
        },
        userID:{
            type:sequelize.INTEGER,
            allowNull:false,
            references:{
                model: User,
                key: 'id',
                validate:{
                    notEmpty:{
                        msg:"User ID is required"
                    },
                    async isLandlord(value){
                        console.log("Validating isLandlord:", value);
                        const user= await User.findByPk(value)
                        console.log(user);
                        if(user.role !== 'LANDLORD'){
                            throw new Error('User ID must be a Landlord')
                        }
                    }
                }

        } 
    }
})

module.exports={ User, Properties };