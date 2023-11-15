const express=require('express')
const app=express();
const bodyParser=require('body-parser');
const cors=require('cors');
const port=process.env.PORT || 3000;

app.use(bodyParser.json())
app.use(cors());






app.listen(port,()=>{
    console.log(`Server is running on port ${port}`)
})



