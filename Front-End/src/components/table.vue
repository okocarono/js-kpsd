<template>
    <div class = "table">
        <header>
        <nav class="navbar">
            <div style="width: 60%">
            	<a href="./">
               		<img id="logo" title="tombol untuk kembali ke halaman utama" src=../assets/img/back2.png style="margin: 0 15% 0 15%">
                </a>
                <div class="navbar-brand">Menu Pembayaran |</div>
            </div>
            <br>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
    </header>

	<div class="container" id = "app">
		<nav>
			<br>
			<div class="row col-md-12">				
				<div class="form-group col-sm-4">
					<select class="form-control" v-model = "kelas">
						<option value = "">KELAS</option>
						<option value = "1">1</option>
						<option value = "2">2</option>
						<option value = "3">3</option>
						<option value = "4">4</option>
						<option value = "5">5</option>
						<option value = "6">6</option>
					</select>
				</div>

				<div class="form-group col-sm-4">
					<select class="form-control" id="">
						<option>PERIODE</option>
						<option>2017/2018</option>
						<option>2018/2019</option>
						<option>2019/2020</option>
					</select>
				</div>

				<div class="form-group col-sm-4">
					<form class="form-inline">
					    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" v-model = "cari">
					    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					  </form>
				</div>
			</div>
		</nav>
		
		<table class="table table-striped table-bordered">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">No</th>
		      <th scope="col">NIS</th>
		      <th scope="col">Nama</th>
		      <th scope="col">Kelas</th>
		      <th scope="col">Tagihan Bulan Ini</th>
		      <th scope="col">Tagihan Semester Ini</th>

		    </tr>
		  </thead>
		  <tbody>
		      <tr :key="x" v-for = "x in cariData" v-if ="x.kelas == kelas || kelas == ''">
		      	<td>{{ x.no }}</td>
		      	<td> <router-link :to="'/rekapan/'+x.nis">{{x.nis}}</router-link></td>
		      	<td>{{ x.nama | capitalize }}</td>
		      	<td>{{ x.kelas }}</td>
		      	<td>{{ tagihanbulan - x.bayar }}</td>
		      	<td>{{ tagihansemester - x.totalbayar }}</td>
		      </tr>
		  </tbody>
		</table>
		
	</div>
    </div>
</template>

<script>
    import swal from 'sweetalert'
    export default {
		name: 'table',
		data() {
			return {

				kelas: '',
		cari: '',
		tagihansemester: 250000, 
		tagihanbulan: 50000,
		// i: 1,
		total: 0,
		totalSiswa: 0,
		siswa: [
			{'no': 1, 'nis': '1234', 'nama': 'maya', 'kelas': '3', 'bayar': 10000, 'pengembangan': 60000, 'donatur': 10000, 'les': 54000, 'ekstra': 75000, 'buku': 15000, 'tpa': 87000, 'totalbayar': 10000, 'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 2, 'nis': '2131', 'nama': 'faiz', 'kelas': '1', 'bayar': 20000, 'pengembangan': 50000, 'donatur': 30000, 'les': 52000, 'ekstra': 35000, 'buku': 25000, 'tpa': 45000,'totalbayar': 20000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0 },
			{'no': 3, 'nis': '7873', 'nama': 'qori', 'kelas': '4', 'bayar': 30000, 'pengembangan': 40000, 'donatur': 10000, 'les': 53000, 'ekstra': 95000, 'buku': 55000, 'tpa': 90000,'totalbayar': 30000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 4, 'nis': '5473', 'nama': 'aulia', 'kelas': '5', 'bayar': 40000, 'pengembangan': 10000, 'donatur': 20000, 'les': 14000, 'ekstra': 41000, 'buku': 75000, 'tpa': 80000,'totalbayar': 40000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 5, 'nis': '0982', 'nama': 'robin', 'kelas': '6', 'bayar': 50000, 'pengembangan': 30000, 'donatur': 40000, 'les': 51000, 'ekstra': 55000, 'buku': 65000, 'tpa': 70000,'totalbayar': 50000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 6, 'nis': '5621', 'nama': 'helty', 'kelas': '2', 'bayar': 6000, 'pengembangan': 45000, 'donatur': 50000, 'les': 56000, 'ekstra': 65000, 'buku': 32000, 'tpa': 60000,'totalbayar': 6000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 7, 'nis': '7861', 'nama': 'shofi', 'kelas': '1', 'bayar': 7000, 'pengembangan': 21000, 'donatur': 70000, 'les': 57000, 'ekstra': 15000, 'buku': 39000, 'tpa': 50000,'totalbayar': 7000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 8, 'nis': '1562', 'nama': 'dila', 'kelas': '3', 'bayar': 8000, 'pengembangan': 70000, 'donatur': 60000, 'les': 58000, 'ekstra': 65000, 'buku': 78000, 'tpa': 40000,'totalbayar': 8000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 9, 'nis': '5617', 'nama': 'insan', 'kelas': '6', 'bayar': 9000, 'pengembangan': 20000, 'donatur': 90000, 'les': 45000, 'ekstra': 34000, 'buku': 54000, 'tpa': 30000,'totalbayar': 9000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 10, 'nis': '9378', 'nama': 'rebecca', 'kelas': '4', 'bayar': 10000, 'pengembangan': 55000, 'donatur': 11000, 'les': 46000, 'ekstra': 49000, 'buku': 44000, 'tpa': 20000,'totalbayar': 10000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},
			{'no': 11, 'nis': '1564', 'nama': 'hery', 'kelas': '5', 'bayar': 11000, 'pengembangan': 65000, 'donatur': 32000, 'les': 43000, 'ekstra': 45000, 'buku': 67000, 'tpa': 10000,'totalbayar': 11000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0},

		],
		daftar: []
		}
	},

	filters: {
		capitalize: function(value) {
			if(!value) return ''
			value = value.toString()
			return value.charAt(0).toUpperCase() + value.slice(1)
		}
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
				var xnama = siswa.nama.charAt(0).toUpperCase() + siswa.nama.slice(1);
				return siswa.nis.match(this.cari) || siswa.nama.match(this.cari) || xnama.match(this.cari);
			});
		}
	}
    }
</script>

<style>
    @import url('../assets/css/bootstrap.min.css');
</style>
