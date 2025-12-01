const mysql = require ('mysql');
const express = require('express');
const router = express.Router();

router.use(express.json());

global.con = mysql.createConnection({
   host: "localhost",
   user: "root",
   password: "",
   database: "computerapp"
});


router.post('/cart',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO cart (`user_id`,`created_at`,`checkout`) VALUES (?,?,?)",
[req.body.user_id,req.body.created_at,req.body.checkout], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});


router.get('/cart', (req,res)=>{
   var cart_id = req.query.cart_id;
          if (cart_id == '%'){
         con.query("SELECT * FROM cart where id LIKE ?", [cart_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM cart where cart_id = ?", [cart_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});




router.delete('/cart',(req,res)=>{
      var cart_id= req.query.cart_id;
      con.query("DELETE FROM cart where cart_id = ?", [cart_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.cart_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.cart_id+"]");
    });
});


router.put('/cart',(req,res)=>{
    console.log("PUT Request Received");
    var cart_id= req.query.cart_id;
    con.query("UPDATE cart SET `user_id` = ?  ,`created_at` = ?  ,`checkout` = ?   WHERE cart_id = " + cart_id ,
    [req.body.user_id,req.body.created_at,req.body.checkout], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ cart_id + "] is Updated Successfully"});
       console.log("Record Id ["+ cart_id+ "] is Updated Successfully");
   });
});


module.exports = router;