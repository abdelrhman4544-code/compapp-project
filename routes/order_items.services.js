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


router.post('/order_items', (req, res) => {
  console.log("Post Request Received");
  con.query(
    "INSERT INTO order_items (`order_id`,`product_id`,`quantity`,`unit_price`,`total_price`) VALUES (?,?,?,?,?)",
    [
      req.body.order_id,
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
router.get('/order_items', (req, res) => {
  var order_item_id = req.query.order_item_id;

  if (order_item_id == '%') {
    con.query("SELECT * FROM order_items WHERE order_item_id LIKE ?", [order_item_id], function (err, result, fields) {
      if (err) throw err;
      res.json(result);
      console.log(result);
    });
  } else {
    con.query("SELECT * FROM order_items WHERE order_item_id = ?", [order_item_id], function (err, result, fields) {
      if (err) throw err;
      res.json(result);
      console.log(result);
    });
  }
});

// DELETE — DELETE
router.delete('/order_items', (req, res) => {
  var order_item_id = req.query.order_item_id;
  con.query("DELETE FROM order_items WHERE order_item_id = ?", [order_item_id], function (err, result, fields) {
    if (err) throw err;
    res.json({ "Status": "OK", "Message": "Record Id [" + req.query.order_item_id + "] Deleted Successfully" });
    console.log("Delete Request Received for record [" + req.query.order_item_id + "]");
  });
});

// UPDATE — PUT
router.put('/order_items', (req, res) => {
  console.log("PUT Request Received");
  var order_item_id = req.query.order_item_id;

  con.query(
    "UPDATE order_items SET `order_id` = ?, `product_id` = ?, `quantity` = ?, `unit_price` = ?, `total_price` = ? WHERE order_item_id = " + order_item_id,
    [
      req.body.order_id,
      req.body.product_id,
      req.body.quantity,
      req.body.unit_price,
      req.body.total_price
    ],
    function (err, result, fields) {
      if (err) throw err;
      res.json({ "Status": "OK", "Message": "Record Id [" + order_item_id + "] Updated Successfully" });
      console.log("Record Id [" + order_item_id + "] Updated Successfully");
    }
  );
});

module.exports = router;
