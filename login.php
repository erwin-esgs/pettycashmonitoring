<?php session_start(); ?>
<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require('koneksi.php');
$username = $_POST["username"];
$password = md5($_POST["password"]);
if (!isset($_SESSION["statusid"]) ) {
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
 
	
	//cek username
	$stmt = $con->prepare( " SELECT nama, status FROM user WHERE  username = ? AND password = ?  ");
	$stmt->bind_param("ss", $username, $password); 
	$stmt->execute();
	//var_dump($stmt);
	$stmt->bind_result($nama,$status);
	$result = $stmt->get_result();
	$con->close();
	
	if ($result->num_rows > 0) {
		while($row = mysqli_fetch_assoc($result)) {
			$_SESSION["statusid"] = $row["status"];
			$_SESSION["nama"] = $row["nama"];
		}
		$_SESSION["username"] = $username;
		
		
		echo "<script language='javascript'>alert('Selamat Datang ".$_SESSION["nama"]." !');window.location.href = 'index.php';</script>";
    }else{
		echo "<script language='javascript'>alert('Login Gagal');window.location.href = 'login.html';</script>";
	}
}else{
	echo "<script language='javascript'>alert('Anda Sudah Login Silahkan Lanjutkan Sesi Anda');window.location.href = 'index.php';</script>";
}
?>
