<html>
<?php 
require('koneksi.php');
	if($statusid !=0){
		echo "<script language='javascript'>alert('Kembali ke Halaman Utama'); window.location.href = 'index.php';</script>";
	}
	echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="transaksibaru.php">Tambah Transaksi</a> </div>'; 
	//echo '<div class="btn-group mr-2" role="group" ><button  type="button" class="btn btn-primary" onclick="popup()">Tambah Saldo</button> </div>'; 
	echo '<div class="btn-group mr-2" role="group" >
			<form method="GET" action="index.php">  
				<input class="textinput1" name="keyword" placeholder="CARI TRANSAKSI" type="number"> 
				<input class="button1" type="submit" value="CARI"><br>
			</form>
		</div>';
	echo '<div class="btn-group mr-2" role="group" > | </div>';
	echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="akun.php">Daftar Akun</a> </div>';
	echo '<div class="btn-group mr-2" role="group" > <a class="btn btn-secondary" href="peminjamlist.php">Daftar Karyawan</a> </div>'; 
	echo '
	<div class="btn-group mr-2" role="group" >
	<div class="dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		Filter
		</button>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			<a class="dropdown-item" href="index.php">Semua</a>
			<a class="dropdown-item" href="index.php?sort=2">Belum Reimburse</a>
			<a class="dropdown-item" href="index.php?sort=1">Sedang Reimburse</a>
		</div>
	</div>
	</div>
	';
	
$con = new mysqli($host, $dbid, $dbpass, $dbname);
//$stmt = $con->prepare( "SELECT saldo FROM user WHERE username = ?" );
//$stmt->bind_param("s", $username ); $stmt->execute();
$stmt = $con->prepare( "SELECT saldo FROM saldo " );  
$stmt->execute();
$result = $stmt->get_result();
while($row = mysqli_fetch_assoc($result)) {
	echo '<div class="btn-group mr-2" role="group" > Saldo Saat Ini:  Rp'.number_format($row["saldo"]).' </div>'; 
}

if (isset($_GET['keyword']) && $_GET['keyword']!='') { // serch 
	//$keyword = "'%{$_GET['keyword']}%'";
	$keyword =  str_replace("'","",$_GET['keyword'])  ;
	$keyword = $con -> real_escape_string($keyword);
	$stmt = $con->prepare( "SELECT * FROM transaksi WHERE idtransaksi LIKE '%$keyword%' ORDER BY idtransaksi DESC" ); $stmt->execute();
	//$stmt->bind_param("s", $keyword ); 
}else{
	if (isset($_GET['sort']) && $_GET['sort']=='2') {
		$stmt = $con->prepare( "SELECT * FROM transaksi WHERE statustrans = 2 ORDER BY idtransaksi DESC" ); $stmt->execute();
	}elseif (isset($_GET['sort']) && $_GET['sort']=='1') {
		$stmt = $con->prepare( "SELECT * FROM transaksi WHERE statustrans = 1 ORDER BY idtransaksi DESC" ); $stmt->execute();
	}elseif (isset($_GET['sort']) && $_GET['sort']=='0') {
		$stmt = $con->prepare( "SELECT * FROM transaksi WHERE statustrans = 0 ORDER BY idtransaksi DESC" ); $stmt->execute();
	}else{
		$stmt = $con->prepare( "SELECT * FROM transaksi ORDER BY idtransaksi DESC" ); $stmt->execute();
	}
}

?>

	<div class="input-group">
		<p class="form-control"> ID Transaksi </p>
		<p class="form-control"> Kode Akun </p>
		<p class="form-control"> Nama Karyawan </p>
		<p class="form-control"> Jumlah </p>
		<p class="form-control"> Keterangan	 </p>
	</div>

<?php

$result = $stmt->get_result();
$con->close();
while($row = mysqli_fetch_assoc($result)) {
	echo '
		<li class="list-group-item d-flex justify-content-between align-items-center">
			<div class="input-group">
				<input type="text" name="idtransaksi" class="form-control" value="'.$row["idtransaksi"].'" readonly>
				<input type="text" name="kodeakun" class="form-control" value="'.$row["kodeakun"].'"  readonly>
				<input type="text" name="karyawan" class="form-control" value="'.$row["karyawan"].'"  readonly>
				<input type="text" name="jumlah" class="form-control" value="Rp '.number_format($row["jumlah"]).'"  readonly>
				<input type="text" name="keterangan" class="form-control" value="'.$row["keterangan"].'"  readonly>
			</div>
		</li>
	';
}

//include ('transaksisaldo.php');
?>
</html>