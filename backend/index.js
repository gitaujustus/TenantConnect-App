const express=require('express')
const app=express();
const bodyParser=require('body-parser');
const cors=require('cors');
const port=process.env.PORT || 8000;

app.use(bodyParser.json())
app.use(cors());

//db connection 
// const sequelize=require('./config/db')
const sequelize= require("./utils")

//test connection of database
sequelize.authenticate().then(()=>{
    console.log('Database connected')
})



//routes
const routes=require('./routes')
app.use('/api',routes)


app.get('/',(req,res)=>{
    res.send('Hello World')
})



  
// app.post('/login', (req, res) => {
//     console.log("connectons reached");
//     const username = req.body.username;
//     const password = req.body.password;
  
//     // Log the received message
//     console.log('Username: ', username);
//     console.log('password: ', password);
  
//     // Send a response
//     res.status(200).json({ status: 'success', message: 'Message received successfully' });
//   });
  






sequelize.sync({force:false}).then(()=>{
    // console.log('Synced')
    app.listen(port,()=>{
      console.log(`Server is running on port ${port}`)
  })
})



// sequelize.sync({ alter: true }).then(() => {
//     // Find the Streams model and drop the table
//     properties.sync({ force: true }).then(() => {
//         console.log("Propeties table dropped and recreated");
//     });

//     app.listen(port, () => {
//         console.log("Server is running on port 8000");
//     });
// });
 




