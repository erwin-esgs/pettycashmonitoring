<?php
require('koneksi.php');
$idkaryawan = $_GET["idkaryawan"];
$nama = $_POST["nama"];
$telepon = $_POST["telepon"];

$con = new mysqli($host, $dbid, $dbpass, $dbname);
$stmt = $con->prepare( "UPDATE karyawan SET nama = ? , telepon = ? WHERE  idkaryawan = ? ");
$stmt->bind_param("sss", $nama, $telepon, $idkaryawan); 
$result = $stmt->execute();
if($result){
		echo "<script language='javascript'>alert('ID Karyawan: ".$idkaryawan." Berhasil Diubah');window.location.href = 'peminjamlist.php';</script>";
	}else{
		echo "<script language='javascript'>alert('Update Gagal');window.location.href = 'peminjamlist.php';</script>";
	}
?>