var express = require('express');
var router = express.Router();

let db = require('../config/database');

let randomString = require('randomstring');

/* GET home page. */
// siswa = {
//     nis : this.nis,
//     nama_siswa : this.nama_siswa,
//     kelas : this.kelas,
//     tagih:{
//         id_pembayaran:this.id_pembayaran,
//         bulan_bayar : this.bulan_bayar,
//         donatur : this.donatur,
//         pengembangan : this.pengembangan,
//         pembelajaran_quran : this.pembelajaran_quran,
//         buku : this.buku,
//         extra : this.extra,
//         les : this.les,
//     }
// }

router.get('/api/pembayaran/', async (req, res, next) => {
    let siswa = new Array();
    // let Siswa = new Object();
    siswa.bayar = new Array();
    // siswa.bayar = new Object();
    try {
        let querySiswa = await db.query('SELECT * FROM siswa');
        let queryTagih = await db.query('SELECT * FROM melakukan, pembayaran, siswa where melakukan.id_pembayaran = pembayaran.id_pembayaran and melakukan.nis = siswa.nis');
        let tagihanBulan = 0;
        for(var i in querySiswa){
            siswa.push({ siswa: querySiswa[i], tagih: new Array(), tagihanBulan: new Array()})
            for(var j in queryTagih){
                if (querySiswa[i].nis == queryTagih[j].nis) {
                    tagihanBulan = queryTagih[j].donatur + queryTagih[j].pengembangan + queryTagih[j].pembelajaran_quran + queryTagih[j].buku + queryTagih[j].extra + queryTagih[j].les;
                    siswa[i].tagih.push(queryTagih[j]);
                    siswa[i].tagihanBulan.push({ bulan: queryTagih[j].bulanBayar , total : tagihanBulan});

                    console.log(tagihanBulan)
                }
                else{
                    // siswa.push(querySiswa[i]);
                }
            }
        }
        // console.log(siswa);
        res.json(siswa);
    } catch (err) {
        throw new Error(err)
    }
    
    // console.log(row);
    // res.JSON(row);
});

router.get('/api/tagihan', async (req, res, next) => {
    let tagihBuku = await db.query('SELECT * FROM beli, buku, siswa where buku.kode_buku = beli.kode_buku and beli.nis = siswa.bis');
    let tagihLes = await db.query('SELECT * FROM les, siswa WHERE les.nis = siswa.nis');
    let tagihExtra = await db.query('SELECT * FROM extra, ambil_extra, siswa WHERE extra.id_extra = ambil_extra.id_extra and ambil_extra.nis = siswa.nis');

    let tagihan = new Array();

    for(let i in tagihBuku){
        for(let j in tagihLes){
            if(tagihBuku[i].nis == tagihLes[j].nis){
                tagihan.push({ nis: tagihBuku[i].nis, kode: tagihBuku[i].kode_buku, tagihanBuku: tagihBuku[i].harga, tagihanLes : tagihLes[j].harga});
            }
            else {
                tagihan.push({ nis: tagihBuku[i].nis, kode: tagihBuku[i].kode_buku, tagihanBuku: tagihBuku[i].harga});
                tagihan.push({ nis: tagihBuku[i].nis, kode: tagihBuku[i].kode_buku, tagihanLes: tagihLes[j].harga });
            }
        }
    }

    let tagihanSiswa = new Array();
    for (let i in tagihan) {
        for (let j in tagihExtra) {
            if (tagihan[i].nis == tagihExtra[j].nis) {
                tagihanSiswa.push({ nis: tagihan[i].nis, kode: tagihan[i].kode_buku, tagihanBuku: tagihan[i].tagihanBuku, tagihanLes: tagihan[j].tagihanLes, tagihanExtra: tagihExtra[j].harga_extra});
            }
            else {
                tagihanSiswa.push({ nis: tagihan[i].nis, kode: tagihan[i].kode_buku, tagihanBuku: tagihan[i].tagihanBuku });
                tagihanSiswa.push({ nis: tagihan[i].nis, kode: tagihan[i].kode_buku, tagihanLes: tagihan[i].tagihanBuku });
            }
        }
    }
    res.json(tagihanSiswa);
})

router.get('/api/pembayaran/:nis', async function (req, res, next) {
    let siswaNis = new Array();
    let count = 0;
    try {
        let querySiswa = await db.query('SELECT * FROM siswa');
        let queryTagih = await db.query('SELECT * FROM melakukan, pembayaran, siswa where melakukan.id_pembayaran = pembayaran.id_pembayaran and melakukan.nis = siswa.nis');
        let tagihanBulan = 0;
        for (var i in querySiswa) {
            
            for (var j in queryTagih) {
                if (querySiswa[i].nis == queryTagih[j].nis) {
                    siswaNis.push({ siswa: querySiswa[i], tagih: queryTagih[j]})
                    count++;
                    console.log(tagihanBulan)
                }
                else {
                    // siswa.push(querySiswa[i]);
                }
            }
            
        }
        // console.log(siswa);
        res.json(siswaNis);
    } catch (err) {
        throw new Error(err)
    }
});

router.post('/api/pembayaran/:nis', async function (req, res, next) {
    let string = randomString.generate(10);
    
    console.log(req.body);
    try{
        let querySiswa = await db.query(`INSERT INTO pembayaran VALUES ("${string}", "${req.params.nis}",${req.body.donatur},${req.body.pengembangan},${req.body.ngaji},${req.body.buku},${req.body.extra},${req.body.les})`);
        res.json("berhasil");
    }
    catch(err) {
        res.json("gagal");
    }
});

// router.delete();
// 
router.put('/api/pembayaran/:nis', async function (req, res, next) {
    // let querySiswa = await db.query(`SELECT * FROM siswa, melakukan, pembayaran
    //           WHERE siswa.nis = '${req.params.nis}' AND
    //                 siswa.nis = melakukan.nis AND
    //                 melakukan.id_pembayaran = pembayaran.id_pembayaran
    //          `);
    // res.json(querySiswa);
});

module.exports = router;