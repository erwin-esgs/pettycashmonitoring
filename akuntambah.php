<?php
require('koneksi.php');
$kodeakun = strval($_POST["kodeakun"]);
$nama = $_POST["nama"];

	//$con = mysqli_connect($host,$dbid,$dbpass,$dbname);
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "SELECT kodeakun FROM akun WHERE  kodeakun = ? ");
	$stmt->bind_param("s", $kodeakun); $stmt->execute();
	$result = $stmt->get_result();
	
	if ($result->num_rows == 0) {
		$stmt = $con->prepare( "INSERT INTO akun (kodeakun, nama) 
	        VALUES ( ? , ? )" );
		$stmt->bind_param("ss", $kodeakun, $nama); ;
		$result = $stmt->execute();
		$con->close();
		if($result){
			echo "<script language='javascript'>alert('Kodeakun : ".$kodeakun." Akun Berhasil Didaftarkan');window.location.href = 'akun.php';</script>";
		}else{
			echo "<script language='javascript'>alert('Akun Gagal Didaftarkan');window.location.href = 'akuntambah.html';</script>";
		}
    }else{
		echo "<script language='javascript'>alert('Pendaftaran Gagal, Akun sudah ada!');window.location.href = 'akun.php';</script>";
	}
	
?>