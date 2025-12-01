const mysql = require('mysql');
const express = require('express');
const router = express.Router();

router.use(express.json());

global.con = mysql.createConnection({
   host: "localhost",
   user: "root",
   password: "",
   database: "computerapp"
});


router.post('/cart_items', (req, res) => {
  console.log("Post Request Received");
  con.query(
    "INSERT INTO cart_items (`cart_id`,`product_id`,`quantity`,`unit_price`,`total_price`) VALUES (?,?,?,?,?)",
    [
      req.body.cart_id,
      req.body.product_id,
      req.body.quantity,
      req.body.unit_price,
      req.body.total_price
    ],
    function (err, result, fields) {
      if (err) throw err;
      res.json({ "Status": "OK", "Message": "Record Added Successfully with Id " + result.insertId });
      console.log("Record Added " + result.insertId);
    }
  );
});

// READ — GET
router.get('/cart_items', (req, res) => {
  var cart_item_id = req.query.cart_item_id;

  if (cart_item_id == '%') {
    con.query("SELECT * FROM cart_items WHERE cart_item_id LIKE ?", [cart_item_id], function (err, result, fields) {
      if (err) throw err;
      res.json(result);
      console.log(result);
    });
  } else {
    con.query("SELECT * FROM cart_items WHERE cart_item_id = ?", [cart_item_id], function (err, result, fields) {
      if (err) throw err;
      res.json(result);
      console.log(result);
    });
  }
});

// DELETE — DELETE
router.delete('/cart_items', (req, res) => {
  var cart_item_id = req.query.cart_item_id;
  con.query("DELETE FROM cart_items WHERE cart_item_id = ?", [cart_item_id], function (err, result, fields) {
    if (err) throw err;
    res.json({ "Status": "OK", "Message": "Record Id [" + req.query.cart_item_id + "] Deleted Successfully" });
    console.log("Delete Request Received for record [" + req.query.cart_item_id + "]");
  });
});

// UPDATE — PUT
router.put('/cart_items', (req, res) => {
  console.log("PUT Request Received");
  var cart_item_id = req.query.cart_item_id;

  con.query(
    "UPDATE cart_items SET `cart_id` = ?, `product_id` = ?, `quantity` = ?, `unit_price` = ?, `total_price` = ? WHERE cart_item_id = " + cart_item_id,
    [
      req.body.cart_id,
      req.body.product_id,
      req.body.quantity,
      req.body.unit_price,
      req.body.total_price
    ],
    function (err, result, fields) {
      if (err) throw err;
      res.json({ "Status": "OK", "Message": "Record Id [" + cart_item_id + "] Updated Successfully" });
      console.log("Record Id [" + cart_item_id + "] Updated Successfully");
    }
  );
});

module.exports = router;