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


router.post('/shipping',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO shipping (`order_id`, `address`,`city`,`status`) VALUES (?,?,?,?)",
[req.body.order_id,req.body.address,req.body.city,req.body.status], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});


router.get('/shipping', (req,res)=>{
   var shipping_id = req.query.shipping_id;
          if (shipping_id == '%'){
         con.query("SELECT * FROM shipping where id LIKE ?", [shipping_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM shipping where shipping_id = ?", [shipping_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});


router.delete('/shipping',(req,res)=>{
      var shipping_id= req.query.shipping_id;
      con.query("DELETE FROM shipping where shipping_id = ?", [shipping_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.shipping_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.shipping_id+"] received");
    });
});


router.put('/shipping',(req,res)=>{
    console.log("PUT Request Received");
    var shipping_id= req.query.shipping_id;
    con.query("UPDATE shipping SET `order_id`= ?, `address` = ? ,`city` = ? ,`status` = ? WHERE shipping_id = " + shipping_id ,
    [req.body.order_id,req.body.address,req.body.city,req.body.status], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ shipping_id + "] is Updated Successfully"});
       console.log("Record Id ["+ shipping_id+ "] is Updated Successfully");
   });
});


module.exports = router;