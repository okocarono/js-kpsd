<template>
    <div class = "utama">
        <header>
        <nav class="navbar">
            <div>
                <img id="logo" src="../assets/img/muhammadiyah.png">
                <div class="navbar-brand">Aplikasi Keuangan|</div>
                <div class="navbar-brand-mdf">SD Muhammadiyah Banguntapan</div>
            </div>
            <br>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

        </nav>
    </header>
    <main id="app">

        <div class="justify-content-md-center" style="height: 20px;">
            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
        </div>

        <div class="container">
            
            <div class="row col-md-12">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Pembayaran</h5>
                            <p class="card-text">Mencakup keseluruhan pembayaran dalam periode tertentu.</p>
                            <a href="./table" class="btn btn-success btn-mdf">PEMBAYARAN</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Data Pembelian Buku</h5>
                            <p class="card-text">Data siswa yang membeli buku dalam setahun.</p>
                            <a href="./buku" class="btn btn-success btn-mdf">DATA BUKU</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Les</h5>
                            <p class="card-text">Data siswa yang mengambil les. Di wajibkan untuk kelas 6.</p>
                            <a href="./les" class="btn btn-success btn-mdf">PEMBAYARAN LES</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="justify-content-md-center" style="height: 20px;">
            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>

        <div class="container">
            <div class="row col-md-12">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Makan Siang</h5>
                            <p class="card-text">Data siswa yang mengambil makan siang dalam periode tertentu.</p>
                            <a href="#" class="btn btn-success btn-mdf" @click="goPremium()">MAKAN SIANG</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Ekstra</h5>
                            <p class="card-text">Data siswa yang mengambil ekstra. Tersedia robotik dan futsal.</p>
                            <a href="./ekstra" class="btn btn-success btn-mdf">PEMBAYARAN EKSTRA</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Tabungan</h5>
                            <p class="card-text">Input data siswa yang akan menabung di hari tertentu.</p>
                            <a href="#" class="btn btn-success btn-mdf" @click="goPremium()">TABUNGAN</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="justify-content-md-center" style="height: 50px;">
            <div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="0"></div>
        </div>
    </main>
    </div>
</template>

<script>
    import swal from 'sweetalert'
    export default {
        name: 'utama',
        methods: {
            goPremium: function(){
                swal('Go Premium', 'Anda Harus Membayar untuk Membuka Fitur Ini', 'warning');
            }
        }
    }
</script>

<style>
    @import url('../assets/css/bootstrap.min.css');
</style>

