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
	echo "<script language='javascript'>alert('Kembali ke Beranda'); window.location.href = 'index.php';</script>";
}
include 'koneksi.php';
include 'navbar.php';
echo '<div class="btn-group mr-2" role="group" ><a href="index.php"><button type="button" class="btn btn-primary" >Kembali</button></a></div>';
echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="peminjamlist.php">Daftar Karyawan</a> </div>';
echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="akuntambah.html">Tambah Akun</a> </div>'; 
echo '<div class="btn-group mr-2" role="group" >
		<form method="GET" action="akun.php">  
			<input class="textinput1" name="keyword" placeholder="CARI AKUN" type="text"> 
			<input class="button1" type="submit" value="CARI">
		</form>
	 </div>';

	
$con = new mysqli($host, $dbid, $dbpass, $dbname);
if (isset($_GET['keyword']) && $_GET['keyword']!='') { // serch 
	//$keyword = "'%{$_GET['keyword']}%'";
	$keyword =  $_GET['keyword'] ;
	$stmt = $con->prepare( "SELECT kodeakun, nama FROM akun WHERE kodeakun LIKE '%$keyword%' ORDER BY kodeakun DESC" ); $stmt->execute();
	//$stmt->bind_param("s", $keyword ); 
}else{
	$stmt = $con->prepare( "SELECT kodeakun, nama FROM akun ORDER BY kodeakun DESC" ); $stmt->execute();
}

$result = $stmt->get_result();
$con->close();
?>

<?php
while($row = mysqli_fetch_assoc($result)) {
	echo '
		<li class="list-group-item d-flex justify-content-between align-items-center">
			<form action="akunubah.php"method="POST">
				<div class="input-group">		
				<input type="text" name="kodeakun" class="input-group-text" value="'.$row["kodeakun"].'" readonly>
				<input type="text" name="nama" class="form-control" value="'.$row["nama"].'"  >
				<button type="submit" class="btn btn-primary" onclick="return confirm()" >Ubah</button>
				<a href="akunhapus.php?kodeakun='.$row["kodeakun"].'"><button type="button" class="btn btn-primary" onclick="return confirm()" >Hapus</button></a>
				</div>
			</form>
		</li>
	';
}
?>
</div>