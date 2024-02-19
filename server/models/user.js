const mongoose=require("mongoose");

const userSchema = mongoose.Schema({
    username:{
        required:true,
        type:String,
        trim:true
    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:(value)=>{
            const re =
            /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            
            return value.match(re);
        },
        message:"Please enter a valid email address"
    },
    password:{
        required:true,
        type:String,
    }
});

const User= mongoose.model("User",userSchema);


module.exports=User;
