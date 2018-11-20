<template>
    <div class = "rekapan">
        <header>
		<nav class="navbar">
			<div style="width: 60%">
				<a href="/table">
					<img id="logo" title="tombol untuk kembali ke halaman utama" src=../assets/img/back2.png style="margin: 0 15% 0 15%">
				</a>
				<div class="navbar-brand">Nama : {{data[0].nama}} | NIS : {{data[0].nis}}</div>
			</div>
			<br>
			<!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			    aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button> -->
		</nav>
	</header>

	<div class="container" id="app">
		<div class = "test">
			<div class="kotak" v-if="tampil" v-bind:class="tampil ? openCSS : closeCSS">
					<div id="atas1">
						<input type="checkbox" value="januari"> Januari
						<br>
						<input type="checkbox" value="februari"> Februari
						<br>
						<input type="checkbox" value="maret"> Maret
						<br>
						<input type="checkbox" value="april"> April
						<br>
						<input type="checkbox" value="mei"> Mei
						<br>
						<input type="checkbox" value="juni"> Juni
						<br>
					</div>
					<div id="atas2">
						<input type="checkbox" name="" id=""> Juli
						<br>
						<input type="checkbox" name="" id=""> Agustus
						<br>
						<input type="checkbox" name="" id=""> September
						<br>
						<input type="checkbox" name="" id=""> Oktober
						<br>
						<input type="checkbox" name="" id=""> November
						<br>
						<input type="checkbox" name="" id=""> Desember
						<br>
					</div> 
					<div id="bawah1">
						<center><input type="button" value="CANCEL" @click="gajadi()"></center>
					</div>
					<div id="bawah2">
						<center><input type="number" placeholder="Nominal Bayar"></center>
					</div>
					<div id="bawah3">
						<center><input type="button" value="SUBMIT" @click="gajadi()"></center>
					</div>
					<br>
				</div>
			</div>
		<br>
		<div class="atas">
			<div class="kanan">

			</div>

			<div class="kiri">
				<div class="row col-md-12">

					<div class="form-group col-sm-4">
						<input type="text" disabled v-model = "tanggal">
					</div>

				</div>
			</div>

			<div class="bawah">
				<table class="table table-striped table-bordered">
					<thead class="thead-dark">
						<tr>
							<!-- <th scope="col">No</th> -->
							<th scope="col">Donatur</th>
							<th scope="col">Pengembangan</th>
							<th scope="col">Les</th>
							<th scope="col">Buku</th>
							<th scope="col">TPA</th>
							<th scope="col">Ekstra</th>
						</tr>
					</thead>
					<tbody>
						<tr :key="x" v-for="x in data">
							<td>{{ x.donatur}}
								<br>
								<button v-on:click="bayar_donatur(x.id)">Bayar</button>
							</td>
							<td>{{ x.pengembangan }}
								<br>
								<button v-on:click="bayar_pengembangan(x.id)">Bayar</button>
							</td>
							<td>{{ x.les }}
								<br>
								<button v-on:click="bayar_les(x.id)">Bayar</button>
							</td>
							<td>{{ x.buku }}
								<br>
								<button v-on:click="bayar_buku(x.id)">Bayar</button>
							</td>
							<td>{{ x.tpa }}
								<br>
								<button v-on:click="bayar_tpa(x.id)">Bayar</button>
							</td>
							<td>{{ x.ekstra }}
								<br>
								<button v-on:click="bayar_ekstra(x.id)">Bayar</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="col-md-12">
					<button class="btn btn-success" @click="cetakNota"> Cetak </button>
				</div>
			</div>
		</div>
    </div>
	</div>
</template>

<script>
	// import VueRouter from 'vue-router'
	import swal from 'sweetalert'
	// Vue.use(VueRouter)

	// var router = new VueRouter()
    export default {
		name: 'rekapan',
	data() {
		return {
			tampil: false,
			openCSS: 'animated fadeInDown',
    	    closeCSS: 'animated fadeOutUp',
			d: new Date(),
			data: [],
			pembayaran:[
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
			kode: ''
		}
	},

	filters: {
		capitalize: function(value) {
			if(!value) return ''
			value = value.toString()
			return value.charAt(0).toUpperCase() + value.slice(1)
		}
	},

	mounted(){
		var kode = window.location.pathname
		// var res = kode.slice(9,13)
		console.log(kode.slice(9,13));
		this.fetchRekapan(kode.slice(9,13));
	},
	computed: {
		tanggal() {
			// return `Tanggal : ${this.d.getDate()} / ${this.d.getMonth() + 1} / ${this.d.getFullYear()}`
			return this.d.toDateString(); 
			var xnama = siswa.nama.charAt(0).toUpperCase() + siswa.nama.slice(1);
			return siswa.nis.match(this.cari) || siswa.nama.match(this.cari) || xnama.match(this.cari);
		}
	},
	methods: {
		fetchRekapan(id){
			// this.$http.get('http://localhost/rekapan/')
			this.pembayaran.forEach(el => {
				console.log(el.nama, el.nis)
				if(el.nis == id) {
					this.data.push({
						nis: el.nis,
						nama: el.nama,
						kelas: el.kelas,
						donatur : el.donatur,
						pengembangan : el.pengembangan,
						les: el.les,
						buku: el.buku,
						tpa: el.tpa,
						ekstra: el.ekstra
					})
				}
			})
		},
		gajadi: function(){
			this.tampil = this.tampil;
			console.log(this.tampil)
		},
		iya: function() {
			this.tampil = !this.tampil;
			console.log(this.tampil)
		},
		cetakNota: function() {
			window.print();
		},
		bayar_donatur: function(id) {
			this.iya()
			
		},
		bayar_pengembangan: function(id) {
			this.iya()
		
		},
		bayar_les: function(id) {
			this.iya()
			
		},
		bayar_buku: function(id) {
			this.iya()
			
		}
	}
    }
</script>

<style>
    @import url('../assets/css/bootstrap.min.css');
</style>
