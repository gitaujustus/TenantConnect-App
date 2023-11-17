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

// app.post('/register', (req, res) => {
//     const username = req.body.username;
//     const email = req.body.email;
//     const password  = req.body.password;
//     const role=req.body.role;

  
//     // Log the received message
//     console.log('Username: ', username);
//     console.log('password: ', password);

//     //Put the data in the database
//     // const sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
  
//     // Send a response (optional)
//     res.status(200).json({ status: 'success', message: 'Message received successfully' });
//   });


  
app.post('/login', (req, res) => {
    console.log("connectons reached");
    const username = req.body.username;
    const password = req.body.password;
  
    // Log the received message
    console.log('Username: ', username);
    console.log('password: ', password);
  
    // Send a response (optional)
    res.status(200).json({ status: 'success', message: 'Message received successfully' });
  });
  



  


sequelize.sync({force: false}).then(()=>{
    console.log('Synced')
    app.listen(port,()=>{
      console.log(`Server is running on port ${port}`)
  })
})




