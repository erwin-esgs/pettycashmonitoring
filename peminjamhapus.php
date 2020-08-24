<?php
require('koneksi.php');
$idkaryawan = $_GET["idkaryawan"];

$con = new mysqli($host, $dbid, $dbpass, $dbname);
$stmt = $con->prepare( "DELETE FROM karyawan WHERE  idkaryawan = ? ");
$stmt->bind_param("s", $idkaryawan); 
$result = $stmt->execute();
if($result){
		echo "<script language='javascript'>alert('ID Karyawan: ".$idkaryawan." Karyawan Berhasil Dihapus');window.location.href = 'index.php';</script>";
	}else{
		echo "<script language='javascript'>alert('Delete Gagal');window.location.href = 'index.php';</script>";
	}
?>