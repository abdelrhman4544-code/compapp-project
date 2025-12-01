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


router.post('/payments',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO payments (`payment_id`,`order_id`, `total_price`,`payment_method`,`payment_status`) VALUES (?,?,?,?,?)",
[req.body.payment_id,req.body.order_id,req.body.total_price,req.body.payment_method,req.body.payment_status], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});



router.get('/payments', (req,res)=>{
   var payment_id = req.query.payment_id;
          if (payment_id == '%'){
         con.query("SELECT * FROM payments where id LIKE ?", [payment_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM payments where payment_id = ?", [payment_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});


router.delete('/payments',(req,res)=>{
      var payment_id= req.query.payment_id;
      con.query("DELETE FROM payments where payment_id = ?", [payment_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.payment_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.payment_id+"] received");
    });
});


router.put('/payments',(req,res)=>{
    console.log("PUT Request Received");
    var payment_id= req.query.payment_id;
    con.query("UPDATE payments SET `payment_id` = ? ,`order_id` = ? , `total_price` = ? ,`payment_method` = ?,`payment_status` = ? WHERE payment_id = " + payment_id ,
    [req.body.payment_id,req.body.order_id,req.body.total_price,req.body.payment_method,req.body.payment_status], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ payment_id + "] is Updated Successfully"});
       console.log("Record Id ["+ payment_id+ "] is Updated Successfully");
   });
});


module.exports = router;
