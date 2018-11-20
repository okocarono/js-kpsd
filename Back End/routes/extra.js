var express = require('express');
var router = express.Router();

let db = require('../config/database');

/* GET home page. */
router.get('/api/extra', async function (req, res, next) {
   let extraQuery = await db.query('SELECT * FROM ekstrakulikuler');
   res.json(extraQuery);
});

router.post('/api/extra', async function (req, res, next) {
    console.log(req.body);
  let string = "INSERT INTO ambil_extra VALUES ";
  
    if(req.body.data.length > 1){
        for(let i = 0; i < req.body.data.length; i++){
            if(req.body.data[i].id_extra.length > 1){
                for (let j = 0; j < req.body.data[i].id_extra.length; j++) {
                    string += `("${req.body.data[i].nis}", "${req.body.data[i].id_extra[j]}"),`;
                }
            }
            else{
                string += `("${req.body.data[i].nis}", "${req.body.data[i].id_extra[0]}"),`;
            }
        }
    }
    else{
        if (req.body.data[0].id_extra.length > 1) {
            for (let j = 0; j < req.body.data[0].id_extra.length; j++) {
                string += `("${req.body.data[0].nis}", "${req.body.data[0].id_extra[j]}"),`;
            }
        }
        else {
            string += `("${req.body.data[0].nis}","${req.body.data[0].id_extra}")`;
        }
    }
    string += '("","")';
    console.log(string);
    db.query(string);
    res.send("berhasil");
});

// router.delete();

// router.put();

module.exports = router;