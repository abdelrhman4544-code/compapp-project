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


router.post('/contact_us',(req,res)=>{

console.log("Post Request Received");

con.query("INSERT INTO contact_us (`name`,`email`,`subject`) VALUES (?,?,?)",
[req.body.name,req.body.email,req.body.subject], function (err, result,fields) {

     if (err) throw err;

     res.json({"Status":"OK", "Message": "Record Added Successfully with Id "+
     result.insertId});
     
     console.log("Record Added"+ result.insertId);
});
});


router.get('/contact_us', (req,res)=>{
   var message_id = req.query.message_id;
          if (message_id == '%'){
         con.query("SELECT * FROM contact_us where id LIKE ?", [message_id], function (err, result, fields) {
         if (err) throw err;
         res.json(result);
         console.log(result);
         });
}
else{
     con.query("SELECT * FROM contact_us where message_id = ?", [message_id], function (err, result, fields) {
       if (err) throw err;
       res.json(result);
       console.log(result);
    });
   }
});




router.delete('/contact_us',(req,res)=>{
      var message_id= req.query.message_id;
      con.query("DELETE FROM contact_us where message_id = ?", [message_id], function (err, result, fields) {
              if (err) throw err;
              res.json({"Status":"OK", "Message" : "Record Id ["+req.query.message_id+"] deleted Successfully"});
              console.log("Delete Request Received for record ["+req.query.message_id+"]");
    });
});


router.put('/contact_us',(req,res)=>{
    console.log("PUT Request Received");
    var message_id= req.query.message_id;
    con.query("UPDATE contact_us SET `name` = ? ,`email` = ?  ,`subject` = ?  WHERE message_id = " + message_id ,
    [req.body.name,req.body.email,req.body.subject], function (err, result, fields) {
       if (err) throw err;
       res.json({"Status":"OK", "Message": "Record Id ["+ message_id + "] is Updated Successfully"});
       console.log("Record Id ["+ message_id+ "] is Updated Successfully");
   });
});


module.exports = router;
