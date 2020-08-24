<?php session_start(); ?>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

  </head>
  <script>
function validasi() { 
var textinput1 = document.getElementsByClassName("form-control");
var saldo = parseInt(document.getElementById("saldo").value);
var jumlah = parseInt(document.getElementById("jumlah").value);
var count = 0;
var count1 = 0;
	
for (i = 0; i < textinput1.length; i++) { 
	if(textinput1[i].value == ""){
		count = count + 1;
	}
}

if(jumlah > saldo){
	count1 = count1 + 1;
}

if(count > 0){
	alert("Semua Kolom Harus Diisi!"); 
	return false;
	}else{
if(count1 > 0){
	alert("Saldo Tidak Mencukupi!");
	return false;
	}else{
	return true;
	}
}
	}
  </script>
  <body>
	<div class="container" style="padding-left:5%;padding-right:5%;">
	<center><h3>Tambah Transaksi</h3></center>
<form action="transaksibaru1.php" method="post" enctype="multipart/form-data" onsubmit="return validasi()">
	
	<?php
	include 'koneksi.php';
	$username = $_SESSION["username"];
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "SELECT saldo FROM saldo " ); 
	//$stmt->bind_param("s", $username ); 
	$stmt->execute();
	$result = $stmt->get_result();
	while($row = mysqli_fetch_assoc($result)) {
		echo '<div class="btn-group mr-2" role="group" > <label for="exampleInputText">Saldo Saat Ini: Rp</label>  <input type="text" id="saldo" name="saldo" value="'.$row["saldo"].'" readonly> </div>'; 
	}
	?>
  <div class="form-group">
    <label for="exampleInputText">Nama Karyawan</label>
	<select class="form-control" name="karyawan">
	<?php 
	require('koneksi.php');
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "SELECT idkaryawan, nama FROM karyawan ORDER BY idkaryawan DESC" ); $stmt->execute();
	$result = $stmt->get_result();
	$con->close();
	while($row = mysqli_fetch_assoc($result)) {
		echo '<option value="'.$row["idkaryawan"].'">'.$row["idkaryawan"].' [ '.$row["nama"].' ]</option>';
	}
	?>
	</select>
  </div>
  
  <div class="form-group">
    <label for="exampleInputText">Jumlah</label>
    <input type="number" id="jumlah" name="jumlah" class="form-control" id="exampleInputText" aria-describedby="emailHelp">
  </div>
  
  <div class="form-group">
    <label for="exampleInputText">Kode akun</label>
	<select class="form-control" name="kodeakun">
	<?php 
	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "SELECT kodeakun, nama FROM akun ORDER BY nama DESC" ); $stmt->execute();
	$result = $stmt->get_result();
	$con->close();
	while($row = mysqli_fetch_assoc($result)) {
		echo '<option value="'.$row["kodeakun"].'">'.$row["kodeakun"].' [ '.$row["nama"].' ]</option>';
	}
	?>
	</select>
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Keterangan</label>
    <input type="text" name="keterangan" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="form-group">
	Pilih Gambar (Max 1mb):<br>
    <input type="file" name="image" class="form-control" /><br>
  </div>
  
    <a href="index.php"><button  type="button" class="btn btn-primary">Kembali</button></a>
  <button type="submit" class="btn btn-primary">Simpan</button>
</form>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>