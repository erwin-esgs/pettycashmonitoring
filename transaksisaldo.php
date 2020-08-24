<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title></title>
  </head>
	<div class="container">
<!--<div id="popup" style="height:100%; width:100%; position:fixed; top:0; left:0; background-color:rgba(80, 80, 80, 0.5); z-index: 2; display:none;"> --> 
		<div id="popup" style="scroll-behavior: smoooth; style="height:100%; width:100%; position:fixed; top:0; left:0; background-color:white;"> 
			<form action="transaksitambahsaldo.php" method="POST"  onsubmit="return validasi()">
				<div class="container" style="padding:5%; width:80%; height:100%;">
					<center><h3>Tambah Saldo</h3></center>
					<?php
						require('koneksi.php');
						$statustrans = 1;
						$con = new mysqli($host, $dbid, $dbpass, $dbname);
						$stmt = $con->prepare( "SELECT saldo FROM saldo " );  
						$stmt->execute();
						$result = $stmt->get_result();
						while($row = mysqli_fetch_assoc($result)) {
							echo 'Saldo awal : <input type="number" id="saldo" name="saldo" value="'.$row["saldo"].'" readonly> <br> <br>'; 
						}
						
					?>
						<table class="table">
						  <thead>
							<tr>
							  <th scope="col">#</th>
							  <th scope="col">ID Transaksi</th>
							  <th scope="col">Nominal</th>
							  <th scope="col">Keterangan</th>
							</tr>
						  </thead>
						  <tbody>
					
					<?php
						$stmt = $con->prepare( "SELECT idtransaksi, jumlah, keterangan FROM transaksi WHERE statustrans = ? " );
						$stmt->bind_param("s", $statustrans); 
						$result = $stmt->execute();
						$result = $stmt->get_result();
						$i=0;
						while($row = mysqli_fetch_assoc($result)) {	
							echo '
							<tr>
									 <td><input type="checkbox" id="transaksi'.$i.'" name="transaksi[]" value="'.$row["idtransaksi"].'" onclick="myfunction('.$i.')">  </td>
									 <td><label>'.$row["idtransaksi"].' Rp </label>  </td>
									 <td><input type="number" id="nominal'.$i.'" value="'.$row["jumlah"].'" readonly> </td>
									 <td><p>'.$row["keterangan"].'</p> </td>
							</tr>
									';
							$i=$i+1;
						}
					?>
							</tbody>
						</table>
					<div class="form-row">
						<div class="col">
						<!--
							<label for="exampleInputText2">Keterangan</label>
							<input type="text" class="form-control" name="keterangan" id="keterangan" value="Pengisian Saldo" />
						-->
						</div>
						<div class="col">
							<label for="jumlah">Jumlah</label>
							<input type="number" name="jumlah" class="form-control" id="jumlah" readonly>
						</div>
					</div>
					<br>
				<!-- <button  type="button" class="btn btn-primary" onclick="popup()">Kembali</button> -->
				<a href="index.php"><button  type="button" class="btn btn-primary">Kembali</button></a>
				<button type="submit" class="btn btn-primary" onclick="return confirm()" >Tambah Saldo</button>
				</div>
				
			<!-- </div> -->
			</form>
		</div>
	</div>
</html>

<script>
var container = document.getElementById("popup");
//container.style.display = "none";
var total = 0;
function popup(){
	if(container.style.display == "none"){
		container.style.display = "block";
	}else{
		container.style.display = "none";
	}
}
function validasi(){
	var jumlah = parseInt(document.getElementById("jumlah").value);
	if(jumlah > 0){
		return true;
	}else{
		alert("Harap isi jumlah yang valid");
		return false;
	}
}
function myfunction(index){
	var checkBox = document.getElementById("transaksi"+index);
	if (checkBox.checked == true){
		total = total + parseInt(document.getElementById("nominal"+index).value);
	}else{
		total = total - parseInt(document.getElementById("nominal"+index).value);
	}
	document.getElementById("jumlah").value = total;
}
</script>