<?php session_start(); ?>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<div class="container">
<?php
$username = $_SESSION["username"];
$nama = $_SESSION["nama"];
$statusid = $_SESSION["statusid"];
if($statusid !=0){
	echo "<script language='javascript'>alert('Kembali ke home'); window.location.href = 'index.php';</script>";
}
include 'koneksi.php';
include 'navbar.php';
echo '<div class="btn-group mr-2" role="group" ><a href="index.php"><button type="button" class="btn btn-primary" >Kembali</button></a></div>';
echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="akun.php">Daftar akun</a> </div>';
echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="register.html">Tambah Karyawan</a> </div>';
echo '<div class="btn-group mr-2" role="group" >
			<form method="GET" action="peminjamlist.php">  
				<input class="textinput1" name="keyword" placeholder="CARI KARYAWAN" type="text"> 
				<input class="button1" type="submit" value="CARI"><br>
			</form>
	</div>';

$con = new mysqli($host, $dbid, $dbpass, $dbname);
if (isset($_GET['keyword']) && $_GET['keyword']!='') { // serch 
	//$keyword = "'%{$_GET['keyword']}%'";
	$keyword =  str_replace("'","",$_GET['keyword'])  ;
	$keyword = $con -> real_escape_string($keyword);
	$stmt = $con->prepare( "SELECT idkaryawan, nama, telepon FROM karyawan WHERE idkaryawan LIKE '%$keyword%' ORDER BY idkaryawan DESC" ); $stmt->execute();
	//$stmt->bind_param("s", $keyword ); 
}else{
	$stmt = $con->prepare( "SELECT idkaryawan, nama, telepon FROM karyawan ORDER BY idkaryawan DESC" ); $stmt->execute();
}

$result = $stmt->get_result();
$con->close();
while($row = mysqli_fetch_assoc($result)) {
	echo '
		<li class="list-group-item d-flex justify-content-between align-items-center">
			<form action="peminjamubah.php?idkaryawan='.$row["idkaryawan"].'"method="POST">
				<div class="input-group">
				<input type="text" class="input-group-text" value="'.$row["idkaryawan"].'" readonly>
				<input type="text" name="nama" class="form-control" value="'.$row["nama"].'"  >
				<input type="text" name="telepon" class="form-control" value="'.$row["telepon"].'"  >
				<button type="submit" class="btn btn-primary" onclick="return confirm()" >Ubah</button>
				<a href="peminjamhapus.php?idkaryawan='.$row["idkaryawan"].'"><button type="button" class="btn btn-primary" onclick="return confirm()" >Hapus</button></a>
				</div>
			</form>
		</li>
	';
}
?>
</div>