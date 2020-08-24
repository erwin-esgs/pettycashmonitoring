<?php
require('koneksi.php');
$idkaryawan = $_POST["idkaryawan"];
$nama = $_POST["nama"];
$telepon = $_POST["telepon"];
//$status = $_POST["status"];
$status = 1;

	//$con = mysqli_connect($host,$dbid,$dbpass,$dbname);
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "SELECT idkaryawan FROM karyawan WHERE  idkaryawan = ? ");
	$stmt->bind_param("s", $idkaryawan); $stmt->execute();
	$result = $stmt->get_result();
	
	if ($result->num_rows == 0) {
		$stmt = $con->prepare( "INSERT INTO karyawan (idkaryawan, nama, telepon) 
	        VALUES ( ? , ? , ? )" );
		$stmt->bind_param("sss", $idkaryawan, $nama, $telepon); 
		$result = $stmt->execute();
		$con->close();
		if($result){
			echo "<script language='javascript'>alert('idkaryawan: ".$idkaryawan." Nama Karyawan Berhasil Didaftarkan');window.location.href = 'peminjamlist.php';</script>";
		}else{
			echo "<script language='javascript'>alert('Pendaftaran Gagal');window.location.href = 'register.html';</script>";
		}
    }else{
		echo "<script language='javascript'>alert('Pendaftaran Gagal, Nama Karyawan Sudah Ada!');window.location.href = 'register.html';</script>";
	}
	
?>