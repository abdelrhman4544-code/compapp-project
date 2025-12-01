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

<<<<<<< HEAD
// GET ALL PRODUCTS (FIXED)
router.get('/products', (req, res) => {
  const query = 'SELECT * FROM products WHERE is_deleted = FALSE';
  
  con.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error: error.message });
    }
    res.json(results);
    console.log("Fetched all products:", results.length);
  });
=======

router.post('/products',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO products (`name`,`price`,`stock`,`status`) VALUES (?,?,?,?)",
[req.body.name,req.body.price,req.body.stock,req.body.status], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
>>>>>>> ad8c9cf3fc5402d2398cd32f49047a7f8b133562
});

// GET SINGLE PRODUCT
router.get('/products', (req, res) => {
   var product_id = req.query.product_id;

   var query = product_id == '%' ?
      "SELECT * FROM products WHERE is_deleted = FALSE" :
      "SELECT * FROM products WHERE product_id = ? AND is_deleted = FALSE";

   con.query(query, [product_id], function (err, result) {
      if (err) {
         res.json({"Status": "Error", "Message": err});
      } else {
         res.json(result);
         console.log(result);
      }
   });
});

// CREATE PRODUCT
router.post('/products',(req,res)=>{
   console.log("Post Request Received");
   con.query("INSERT INTO products (`name`,`price`,`stock`,`status`) VALUES (?,?,?,?)",
   [req.body.name,req.body.price,req.body.stock,req.body.status], function (err, result,fields) {
      if (err) throw err;
      res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
      result.insertId});
      console.log("Record Added"+ result.insertId);
   });
});

// DELETE PRODUCT (SOFT DELETE)
router.delete('/products', (req, res) => {
   var product_id = req.query.product_id;
   con.query(
      "UPDATE products SET is_deleted = TRUE WHERE product_id = ?",
      [product_id],
      function (err, result) {
         if (err) {
            res.json({"Status": "Error", "Message": err});
         } else {
            res.json({"Status": "OK", "Message": "Record marked as deleted (soft delete)."});
            console.log("Soft delete applied to record [" + product_id + "]");
         }
      }
   );
});

// UPDATE PRODUCT
router.put('/products',(req,res)=>{
    console.log("PUT Request Received");
    var product_id= req.query.product_id;
<<<<<<< HEAD
    con.query("UPDATE products SET `name`= ?, `price` = ? , `stock` = ? , `status` = ? WHERE product_id = " + product_id ,
    [req.body.name,req.body.price,req.body.stock,req.body.status], function (err, result, fields) {
=======
    con.query("UPDATE products SET `name`= ?, `price` = ? , `stock` = ?, `status` = ? WHERE product_id = " + product_id ,
    [req.body.name,req.body.price,req.body.stock], function (err, result, fields) {
>>>>>>> ad8c9cf3fc5402d2398cd32f49047a7f8b133562
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ product_id + "] is Updated Successfully"});
       console.log("Record Id ["+ product_id+ "] is Updated Successfully");
   });
});

<<<<<<< HEAD
module.exports = router;
=======



module.exports = router;
>>>>>>> ad8c9cf3fc5402d2398cd32f49047a7f8b133562
