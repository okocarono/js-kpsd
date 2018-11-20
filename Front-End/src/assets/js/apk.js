new Vue({
	el: '#app',
	data: {
		kelas: '',
		cari: '',
		tagihansemester: 250000, 
		tagihanbulan: 50000,
		// i: 1,
		total: 0,
		totalSiswa: 0,
		siswa:[
			{ 'no': 1, 'nis': '1234', 'nama': 'Maya', 'kelas': '3', 'bayar': 10000, 'totalbayar': 10000, 'buku1': 0, 'ambil1': 0, 'buku2': 0, 'ambil2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 2, 'nis': '2131', 'nama': 'Faiz', 'kelas': '1', 'bayar': 20000, 'totalbayar': 20000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0 },
			{'no': 3, 'nis': '7873', 'nama': 'Qori', 'kelas': '4', 'bayar': 30000, 'totalbayar': 30000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 4, 'nis': '5473', 'nama': 'Aulia', 'kelas': '5', 'bayar': 40000, 'totalbayar': 40000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 5, 'nis': '0982', 'nama': 'Robin', 'kelas': '6', 'bayar': 50000, 'totalbayar': 50000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 6, 'nis': '5621', 'nama': 'Helty', 'kelas': '2', 'bayar': 6000, 'totalbayar': 6000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 7, 'nis': '7861', 'nama': 'Shofi', 'kelas': '1', 'bayar': 7000, 'totalbayar': 7000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 8, 'nis': '1562', 'nama': 'Dila', 'kelas': '3', 'bayar': 8000, 'totalbayar': 8000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 9, 'nis': '5617', 'nama': 'Insan', 'kelas': '6', 'bayar': 9000, 'totalbayar': 9000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 10, 'nis': '9378', 'nama': 'Rebecca', 'kelas': '4', 'bayar': 10000, 'totalbayar': 10000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 11, 'nis': '1564', 'nama': 'Hery', 'kelas': '5', 'bayar': 11000, 'totalbayar': 11000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},

		],
		daftar: []
	},

	created(){
		for(var i = 0; i < this.siswa.length; i++){
			this.total += this.siswa[i].jumlah
		}

		this.totalSiswa = this.siswa.length
	},
	methods: {
		simpan() {
			var test = [];

			this.siswa.forEach(dt => {
				if(dt.buku1) dt.ambil = 1;
				dt.ambil1 = dt.buku1,
				dt.ambil2 = dt.buku2

				console.log(dt.buku1)
			})

			this.siswa.forEach(dt => {
				test.push({
					nis: dt.nis,
					buku1: dt.buku1,
					buku2: dt.buku2,
					buku3: dt.buku3,
					buku4: dt.buku4,
				})
			})
			
			swal('Terimakasih', 'Data Berhasil Disimpan', 'success')
			// alert(`${test[0].nis} - ${test[0].buku2}`)
		}
	},	
	computed: {
		cariData: function(){
			return this.siswa.filter((siswa) => {
					return siswa.nis.match(this.cari) || siswa.nama.match(this.cari);
			});
		}
	}
});