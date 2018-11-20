var express = require('express');
var router = express.Router();

let db = require('../config/database');

/* GET home page. */
router.get('/api/buku', async function (req, res, next) {
    // db.query(`SELECT * FROM siswa, beli, buku WHERE siswa.nis = beli.nis and beli.kode_buku = buku.kode_buku`)
    let bukuQuery = await db.query(`SELECT * FROM buku`);
    res.json(bukuQuery);
});

router.post('/api/buku', function(req, res, next){

});

// router.delete();

// router.put();

module.exports = router;