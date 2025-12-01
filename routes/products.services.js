const mysql = require('mysql');
const express = require('express');
const router = express.Router();

router.use(express.json());

// DB connection
global.con = mysql.createConnection({
   host: "localhost",
   user: "root",
   password: "",
   database: "computerapp"
});

// ---------------------
// GET ALL PRODUCTS
// ---------------------
router.get('/products', (req, res) => {
  const query = 'SELECT * FROM products WHERE is_deleted = FALSE';

  con.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error: error.message });
    }
    res.json(results);
    console.log("Fetched all products:", results.length);
  });
});

// ---------------------
// GET PRODUCT BY ID
// ---------------------
router.get('/product', (req, res) => {
   const product_id = req.query.product_id;

   const query = "SELECT * FROM products WHERE product_id = ? AND is_deleted = FALSE";

   con.query(query, [product_id], (err, result) => {
      if (err) {
         res.json({ Status: "Error", Message: err });
      } else {
         res.json(result);
      }
   });
});

// ---------------------
// CREATE PRODUCT
// ---------------------
router.post('/products', (req, res) => {
   con.query(
     "INSERT INTO products (`name`,`price`,`stock`,`status`) VALUES (?,?,?,?)",
     [req.body.name, req.body.price, req.body.stock, req.body.status],
     (err, result) => {
       if (err) throw err;
       res.json({
         Status: "OK",
         Message: "Record Added Successfully with Id " + result.insertId
       });
     }
   );
});

// ---------------------
// UPDATE PRODUCT
// ---------------------
router.put('/products', (req, res) => {
   const product_id = req.query.product_id;

   con.query(
     "UPDATE products SET `name`= ?, `price` = ?, `stock` = ?, `status` = ? WHERE product_id = ?",
     [req.body.name, req.body.price, req.body.stock, req.body.status, product_id],
     (err, result) => {
       if (err) throw err;
       res.json({
         Status: "OK",
         Message: `Record Id [${product_id}] Updated Successfully`
       });
     }
   );
});

// ---------------------
// SOFT DELETE PRODUCT
// ---------------------
router.delete('/products', (req, res) => {
   const product_id = req.query.product_id;

   con.query(
     "UPDATE products SET is_deleted = TRUE WHERE product_id = ?",
     [product_id],
     (err, result) => {
       if (err) {
         res.json({ Status: "Error", Message: err });
       } else {
         res.json({
           Status: "OK",
           Message: "Record marked as deleted (soft delete)."
         });
       }
     }
   );
});

module.exports = router;

