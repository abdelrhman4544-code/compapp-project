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
   console.log('computerapp database is connected');
});

router.post('/user',(req,res)=>{
console.log("Post Request Received");
con.query("INSERT INTO user (`name`, `email`,`password`) VALUES (?,?,?)",
[req.body.name,req.body.email,req.body.password], function (err, result,fields) {
     if (err) throw err;
     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     console.log("Record Added"+ result.insertId);
});
});

router.get('/user', (req, res) => {
   var user_id = req.query.user_id;

   var query = user_id == '%' ?
      "SELECT * FROM user WHERE is_deleted = FALSE" :
      "SELECT * FROM user WHERE user_id = ? AND is_deleted = FALSE";

   con.query(query, [user_id], function (err, result) {
      if (err) {
         res.json({"Status": "Error", "Message": err});
      } else {
         res.json(result);
         console.log(result);
      }
   });
});

router.delete('/user', (req, res) => {
   var user_id = req.query.user_id;
   con.query(
      "UPDATE user SET is_deleted = TRUE WHERE user_id = ?",
      [user_id],
      function (err, result) {
         if (err) {
            res.json({"Status": "Error", "Message": err});
         } else {
            res.json({"Status": "OK", "Message": "Record marked as deleted (soft delete)."});
            console.log("Soft delete applied to record [" + user_id + "]");
         }
      }
   );
});



router.put('/user',(req,res)=>{
    console.log("PUT Request Received");
    var user_id= req.query.user_id;
    con.query("UPDATE user SET `name`= ?, `email` = ? ,`password` = ? WHERE user_id = " + user_id ,
    [req.body.name,req.body.email,req.body.password], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ user_id + "] is Updated Successfully"});
       console.log("Record Id ["+ user_id+ "] is Updated Successfully");
   });
});


router.get('/search',(req,res)=>{
   keyword = req.query.keyword;
   keyvalue = req.query.keyvalue;
   sort = req.query.sort;
   con.query("SELECT * FROM user where "+keyword+" = ? order by user_id " + sort , [keyvalue],
   function (err, result, fields) {
if (err) {res.json({"Status": "Error","Message": err});}
else{
res.json(result);
console.log(result);
}
});
    console.log (`Incoming search Request`);
});


router.get('/login',(req,res)=>{
   con.query("SELECT * FROM user where email = ? and password= ?",
   [req.query.email, req.query.password], function (err, result, fields) {
   if (err) {res.json({"Status": "Error","Message": err});}
   else{
   if (result.length == 0){
      res.json({"Status": "Error","Message": "Authentication Failed, Check email or password ...!!!"}); console.log(result);}
   else{
       res.json({"Status": "OK","Message": "Loged In Successfully"});
       console.log(result);}}
});
       console.log (`Incoming login Request`);
});


module.exports = router;