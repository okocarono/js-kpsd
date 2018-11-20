<template>
    <div class = "ekstra">
        <header>
		<nav class="navbar">
			<div style="width: 60%">
				<a href="./">
					<img id="logo" title="Tombol untuk kembali ke halaman utama" src=../assets/img/back2.png style="margin: 0 15% 0 15%">
				</a>
				<div class="navbar-brand">Menu Pembayaran Ekstra |</div>
			</div>
			<br>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			    aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
	</header>
	<div class="container" id="haha">
		<br>
		<nav class="row col-md-12">
			<div class="col-md-5">
				<div class="form-group col-md-4">
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
            <div class="col-md-5">
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" v-model = "cari">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-2">
				<button class="btn btn-success" @click="simpan()"> Simpan </button>
			</div>
        </nav>
		<br>

		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">NIS</th>
					<th scope="col">NAMA</th>
					<th scope="col">Robotik</th>
					<th scope="col">Futsal</th>
				</tr>
			</thead>
			<tbody>
                    <!-- <td>{{test}}</td> -->
				<tr :key="x" v-for="x in cariData" v-if="x.kelas == kelas || kelas == ''">
					<td>{{ x.nis }}</td>
					<td>{{ x.nama | capitalize }}</td>
					<td>
						<input type="checkbox" v-model="x.robotik"> </td>
					<td>
						<input type="checkbox" v-model="x.futsal"> </td>
				</tr>

			</tbody>
			
        </table>

		<br>

	</div>
    </div>
</template>

<script>
    import swal from 'sweetalert'
    export default {
		name: 'ekstra',
		data() {
			return {
				kelas: '',
				cari: '',
				test: 'coba dulu',
				siswa: [
					{'no': 1, 'nis': '1234', 'nama': 'maya', 'kelas': '3', 'bayar': 	10000, 'totalbayar': 10000, 'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 2, 'nis': '2131', 'nama': 'faiz', 'kelas': '1', 'bayar': 	20000, 'totalbayar': 20000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0 },
					{'no': 3, 'nis': '7873', 'nama': 'qori', 'kelas': '4', 'bayar': 	30000, 'totalbayar': 30000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 4, 'nis': '5473', 'nama': 'aulia', 'kelas': '5', 'bayar': 	40000, 'totalbayar': 40000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 5, 'nis': '0982', 'nama': 'robin', 'kelas': '6', 'bayar': 	50000, 'totalbayar': 50000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 6, 'nis': '5621', 'nama': 'helty', 'kelas': '2', 'bayar': 	6000, 'totalbayar': 6000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 7, 'nis': '7861', 'nama': 'Shofi', 'kelas': '1', 'bayar': 	7000, 'totalbayar': 7000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 8, 'nis': '1562', 'nama': 'dila', 'kelas': '3', 'bayar': 	8000, 'totalbayar': 8000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 9, 'nis': '5617', 'nama': 'insan', 'kelas': '6', 'bayar': 	9000, 'totalbayar': 9000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 10, 'nis': '9378', 'nama': 'rebecca', 'kelas': '4', 'bayar': 10000, 'totalbayar': 10000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
					{'no': 11, 'nis': '1564', 'nama': 'hery', 'kelas': '5', 'bayar': 11000, 'totalbayar': 11000,'buku1': 0, 'buku2': 0, 'buku3': 0, 'buku4': 0, 'ambil': 0, 'robotik': 0, 'futsal': 0},
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
			
		swal('Terimakasih', 'Data Berhasil Disimpan', 'success')
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