<?php
session_start();
require('koneksi.php');
date_default_timezone_set("Asia/Bangkok");
$idtransaksi = strval(date('ymdHis', time()));
$kodeakun = "1101010";
$karyawan = "--Pengisian Saldo--";
$jumlah = intval($_POST["jumlah"]);

 if(isset($_POST["keterangan"])){
	$keterangan = $_POST["keterangan"];
}else{
$keterangan = '';
}
$kredit = 0;
$status = 0;

error_reporting(E_ALL);
ini_set('display_errors', 1);

	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "INSERT INTO transaksi (idtransaksi, kodeakun, karyawan, jumlah, keterangan, kredit, statustrans) 
							VALUES ( ? , ? , ? , ? , ? , ? , ?) ");
							echo $con->error;
	$stmt->bind_param("sssisii", $idtransaksi, $kodeakun, $karyawan, $jumlah, $keterangan , $kredit , $status ); $stmt->execute();
	$result = $stmt->get_result();
	
	
	// $username = $_SESSION["username"];
	// $stmt = $con->prepare( "SELECT saldo FROM user WHERE username = ?" ); 
	// $stmt->bind_param("s", $username ); $stmt->execute();
	// $result = $stmt->get_result();
	// while($row = mysqli_fetch_assoc($result)) {
		// $saldo = intval($jumlah) + intval($row["saldo"]);
	// }
	$saldo = $_POST["saldo"] + $jumlah;
	
	// $stmt = $con->prepare( "UPDATE saldo SET saldo = ?   WHERE  username = ? " );
	// $stmt->bind_param("ss",  $saldo, $username); 
	$stmt = $con->prepare( "UPDATE saldo SET saldo = ?  " );
	$stmt->bind_param("s",  $saldo); 
	$result = $stmt->execute();
	
	for($i=0; $i<count($_POST["transaksi"]); $i++){
		$stmt = $con->prepare( "UPDATE transaksi SET statustrans = ?   WHERE  idtransaksi = ? " );
		$stmt->bind_param("is",  $status, $_POST["transaksi"][$i]); 
		$result = $stmt->execute();
	}
	
	$con->close();
if ($result) {
    echo "<script language='javascript'>alert('Tambah Saldo Berhasil');window.location.href = 'index.php';</script>";
} else {
    echo "<script language='javascript'>alert('Tambah Saldo Gagal');window.location.href = 'index.php';</script>";
}

?>