<?php

$koneksi = new mysqli('localhost','root','','db_produk');
$nama_produk = $_POST['nama_produk'];
$harga_produk = $_POST['harga_produk'];
$data = mysqli_query($koneksi, "INSERT INTO tb_produk SET nama_produk='$nama_produk', harga_produk = '$harga_produk'");

if ($data) {
    echo json_encode([
        'pesan'=>'Sukses'
    ]);
}else{
    echo json_encode([
        'pesan'=>'gagal'
    ]);
}

?>