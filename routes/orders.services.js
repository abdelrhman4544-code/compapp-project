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


router.post('/orders',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO orders (`user_id`,`order_date`,`total_price`) VALUES (?,?,?,?)",
[req.body.user_id,req.body.order_date,req.body.total_price], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});


router.get('/orders', (req,res)=>{
   var order_id = req.query.order_id;
          if (order_id == '%'){
         con.query("SELECT * FROM orders where id LIKE ?", [order_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM orders where order_id = ?", [order_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});




router.delete('/orders',(req,res)=>{
      var order_id= req.query.order_id;
      con.query("DELETE FROM orders where order_id = ?", [order_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.order_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.order_id+"]");
    });
});


router.put('/orders',(req,res)=>{
    console.log("PUT Request Received");
    var order_id= req.query.order_id;
    con.query("UPDATE orders SET `user_id` = ?  ,`order_date` = ?  ,`total_price` = ?   WHERE order_id = " + order_id ,
    [req.body.user_id,req.body.quantity,req.body.total_price], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ order_id + "] is Updated Successfully"});
       console.log("Record Id ["+ order_id+ "] is Updated Successfully");
   });
});


module.exports = router;
