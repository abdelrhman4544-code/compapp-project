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

   con.connect(function(err) {
   if (err) throw err;
   console.log('');
});

router.post('/product_suppliers',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO product_suppliers (`product_id`,`supplier_id`) VALUES (?,?)",
[req.body.product_id,req.body.supplier_id], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});

router.get('/product_suppliers', (req, res) => {
   var product_supplier_id = req.query.product_supplier_id;

   var query = product_supplier_id == '%' ?
      "SELECT * FROM product_suppliers WHERE is_deleted = FALSE" :
      "SELECT * FROM product_suppliers WHERE product_supplier_id = ? AND is_deleted = FALSE";

   con.query(query, [product_supplier_id], function (err, result) {
      if (err) {
         res.json({"Status": "Error", "Message": err});
      } else {
         res.json(result);
         console.log(result);
      }
   });
});

router.delete('/product_suppliers', (req, res) => {
   var product_supplier_id = req.query.product_supplier_id;
   con.query(
      "UPDATE product_suppliers SET is_deleted = TRUE WHERE product_supplier_id = ?",
      [product_supplier_id],
      function (err, result) {
         if (err) {
            res.json({"Status": "Error", "Message": err});
         } else {
            res.json({"Status": "OK", "Message": "Record marked as deleted (soft delete)."});
            console.log("Soft delete applied to record [" + product_supplier_id + "]");
         }
      }
   );
});



router.put('/product_suppliers',(req,res)=>{
    console.log("PUT Request Received");
    var product_supplier_id= req.query.product_supplier_id;
    con.query("UPDATE product_suppliers SET `product_id`= ?, `supplier_id` = ?  WHERE product_supplier_id = " + product_supplier_id ,
    [req.body.product_id,req.body.supplier_id], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ product_supplier_id + "] is Updated Successfully"});
       console.log("Record Id ["+ product_supplier_id+ "] is Updated Successfully");
   });
});


module.exports = router;