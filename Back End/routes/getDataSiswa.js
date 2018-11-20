let express = require('express');
let router = express.Router();

let db = require('../config/database');

router.get('/api/datasiswa',async (req, res, next) => {
    console.log(req.params.kelas)
    let dbQuery = await db.query(`SELECT * FROM siswa`);
    res.json(dbQuery);
})

// router.delete();

// router.put('/api/datasiswa/:id');


module.exports = router;