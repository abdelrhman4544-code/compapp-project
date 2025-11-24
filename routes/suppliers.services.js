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


router.post('/suppliers',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO suppliers (`name`, `contact_email`,`phone`,`address`) VALUES (?,?,?,?)",
[req.body.name,req.body.contact_email,req.body.phone,req.body.address], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});


router.get('/suppliers', (req,res)=>{
   var supplier_id = req.query.supplier_id;
          if (supplier_id == '%'){
         con.query("SELECT * FROM suppliers where id LIKE ?", [supplier_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM suppliers where supplier_id = ?", [supplier_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});


router.delete('/suppliers',(req,res)=>{
      var supplier_id= req.query.supplier_id;
      con.query("DELETE FROM suppliers where supplier_id = ?", [supplier_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.supplier_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.ssupplier_id+"] received");
    });
});


router.put('/suppliers',(req,res)=>{
    console.log("PUT Request Received");
    var supplier_id= req.query.supplier_id;
    con.query("UPDATE suppliers SET `name`= ?, `contact_email` = ? ,`phone` = ? ,`address` = ? WHERE supplier_id = " + supplier_id ,
    [req.body.name,req.body.contact_email,req.body.phone,req.body.address], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ supplier_id + "] is Updated Successfully"});
       console.log("Record Id ["+ supplier_id+ "] is Updated Successfully");
   });
});

module.exports = router;