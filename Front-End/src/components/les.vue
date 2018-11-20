<template>
    <div class = "les">
        <header>
		<nav class="navbar">
			<div style="width: 60%">
				<a href="./">
					<img id="logo" title="Tombol untuk kembali ke halaman utama" src=../assets/img/back2.png style="margin: 0 15% 0 15%">
				</a>
				<div class="navbar-brand">Menu Pembayaran Les |</div>
			</div>
			<br>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			    aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
	</header>
	<div class="container" id="app">
		<br>
		<nav class="row col-md-12">
			<div class="col-md-2">
				<div class="form-group col-md-11">
					<select class="form-control" v-model="kelas">
						<option value="">KELAS</option>
						<option value="1">KELAS 1</option>
						<option value="2">KELAS 2</option>
						<option value="3">KELAS 3</option>
						<option value="4">KELAS 4</option>
						<option value="5">KELAS 5</option>
						<option value="6">KELAS 6</option>
					</select>
				</div>
			</div>
			<div class="col-md-2">
				<div class="form-group col-md-10">
					<select class="form-control" v-model="semester">
						<option value="gasal">Gasal</option>
						<option value="genap">Genap</option>
					</select>
				</div>
			</div>
			<div class="form-group col-md-4">
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" v-model="cari">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-4">
				<button class="btn btn-success" @click="simpan()"> Simpan </button>
			</div>
		</nav>
		<br>

		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">NIS</th>
					<th scope="col">NAMA</th>
					<th scope="col">AMBIL</th>
					<th scope="col">TIDAK AMBIL</th>
				</tr>
			</thead>
			<tbody>
				<tr :key="x" v-for="x in cariData" v-if="x.kelas == kelas || kelas == ''">
					<td>{{ x.nis }} </td>
					<td>{{ x.nama | capitalize }}</td>
					<td>
						<input type="radio" v-bind:name="les" value="1" v-model="x.ambil"> </td>
					<td>
						<input type="radio" v-bind:name="les" value="0" v-model="x.ambil"> </td>
				</tr>

			</tbody>
			<tfoot>
				<td>
					<b>Biaya Semester ini</b>
				</td>
				<td colspan="5">
					<b>Rp. {{ biaya }} ,-</b>
				</td>
			</tfoot>
		</table>

		<br>

	</div>
    </div>
</template>

<script>
    import swal from 'sweetalert'
    export default{
		name: 'les',
		data() {
			return {

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
			{'no': 1, 'nis': '1234', 'nama': 'maya', 'kelas': '3', 'bayar': 	10000, 'totalbayar': 10000, 'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 2, 'nis': '2131', 'nama': 'faiz', 'kelas': '1', 'bayar': 	20000, 'totalbayar': 20000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0 },
			{'no': 3, 'nis': '7873', 'nama': 'qori', 'kelas': '4', 'bayar': 	30000, 'totalbayar': 30000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 4, 'nis': '5473', 'nama': 'aulia', 'kelas': '5', 'bayar': 	40000, 'totalbayar': 40000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 5, 'nis': '0982', 'nama': 'robin', 'kelas': '6', 'bayar': 	50000, 'totalbayar': 50000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 6, 'nis': '5621', 'nama': 'helty', 'kelas': '2', 'bayar': 	6000, 'totalbayar': 6000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 7, 'nis': '7861', 'nama': 'shofi', 'kelas': '1', 'bayar': 	7000, 'totalbayar': 7000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 8, 'nis': '1562', 'nama': 'dila', 'kelas': '3', 'bayar': 	8000, 'totalbayar': 8000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 9, 'nis': '5617', 'nama': 'insan', 'kelas': '6', 'bayar': 	9000, 'totalbayar': 9000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 10, 'nis': '9378', 'nama': 'rebecca', 'kelas': '4', 'bayar': 10000, 'totalbayar': 10000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},
			{'no': 11, 'nis': '1564', 'nama': 'hery', 'kelas': '5', 'bayar': 11000, 'totalbayar': 11000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0},

		]
		}
	},
	filters: {
		capitalize: function(value) {
			if(!value) return ''
			value = value.toString()
			return value.charAt(0).toUpperCase() + value.slice(1)
		}
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
					var xnama = siswa.nama.charAt(0).toUpperCase() + siswa.nama.slice(1);
					return siswa.nis.match(this.cari) || siswa.nama.match(this.cari) || xnama.match(this.cari);
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
    }
</script>

<style>
    @import url('../assets/css/bootstrap.min.css');
</style>