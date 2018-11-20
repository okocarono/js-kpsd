new Vue({
	el: '#app',
	data: {
		cari: '',
		kelas: '1',
		semester: 'genap',
		hargaLes: [
					{'kelas': 1, 'semester': 'gasal', 'biaya': 30000},
					{'kelas': 1, 'semester': 'genap', 'biaya': 40000},
					{'kelas': 2, 'semester': 'gasal', 'biaya': 30000},
					{'kelas': 2, 'semester': 'genap', 'biaya': 40000},
					{'kelas': 3, 'semester': 'gasal', 'biaya': 30000},
					{'kelas': 3, 'semester': 'genap', 'biaya': 40000},
					{'kelas': 4, 'semester': 'gasal', 'biaya': 30000},
					{'kelas': 4, 'semester': 'genap', 'biaya': 40000},
					{'kelas': 5, 'semester': 'gasal', 'biaya': 30000},
					{'kelas': 5, 'semester': 'genap', 'biaya': 40000},
					{'kelas': 6, 'semester': 'gasal', 'biaya': 40000},
					{'kelas': 6, 'semester': 'genap', 'biaya': 50000},
		],
		siswa:[
			{'no': 1, 'nis': '1234', 'nama': 'Maya', 'kelas': '3', 'bayar': 	10000, 'totalbayar': 10000, 'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 2, 'nis': '2131', 'nama': 'Faiz', 'kelas': '1', 'bayar': 	20000, 'totalbayar': 20000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0 },
			{'no': 3, 'nis': '7873', 'nama': 'Qori', 'kelas': '4', 'bayar': 	30000, 'totalbayar': 30000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 4, 'nis': '5473', 'nama': 'Aulia', 'kelas': '5', 'bayar': 	40000, 'totalbayar': 40000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 5, 'nis': '0982', 'nama': 'Robin', 'kelas': '6', 'bayar': 	50000, 'totalbayar': 50000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 6, 'nis': '5621', 'nama': 'Helty', 'kelas': '2', 'bayar': 	6000, 'totalbayar': 6000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 7, 'nis': '7861', 'nama': 'Shofi', 'kelas': '1', 'bayar': 	7000, 'totalbayar': 7000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 8, 'nis': '1562', 'nama': 'Dila', 'kelas': '3', 'bayar': 	8000, 'totalbayar': 8000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 9, 'nis': '5617', 'nama': 'Insan', 'kelas': '6', 'bayar': 	9000, 'totalbayar': 9000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 10, 'nis': '9378', 'nama': 'Rebecca', 'kelas': '4', 'bayar': 10000, 'totalbayar': 10000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 11, 'nis': '1564', 'nama': 'Hery', 'kelas': '5', 'bayar': 11000, 'totalbayar': 11000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},

		]
	},
	methods: {
		simpan() {
			var test = [];
			
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
		}
	},
	computed: {
		cariData: function(){
			return this.siswa.filter((siswa) => {
					return siswa.nis.match(this.cari) || siswa.nama.match(this.cari);
			})
		},
		biaya() {
			for(var i=0; i<12; i++) {
				if(this.semester == this.hargaLes[i].semester && this.kelas == this.hargaLes[i].kelas) {
					return this.hargaLes[i].biaya;
					break;
				}
			}
		}
	}
})