<?php
require('koneksi.php');
$kodeakun = $_GET["kodeakun"];
$con = new mysqli($host, $dbid, $dbpass, $dbname);
$stmt = $con->prepare( "DELETE FROM akun WHERE  kodeakun = ? ");
$stmt->bind_param("s", $kodeakun); 
$result = $stmt->execute();
if($result){
		echo "<script language='javascript'>alert('Kodeakun : ".$kodeakun." Akun Berhasil Dihapus');window.location.href = 'akun.php';</script>";
	}else{
		echo "<script language='javascript'>alert('Akun Gagal Dihapus');window.location.href = 'akun.php';</script>";
	}
?>