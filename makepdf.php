<?php
require 'fpdf/fpdf.php';
require('koneksi.php');

error_reporting(-1);
ini_set('display_errors', 'On');
	$bulan = substr(str_replace("-","",$_POST["bulan"]) , 2, 4);
    $jumlahdebet=0;
    $jumlahkredit=0;
    
    $con = new mysqli($host, $dbid, $dbpass, $dbname);
	 
    $stmt = $con->prepare( "SELECT * FROM transaksi WHERE idtransaksi LIKE '%$bulan%' ORDER BY idtransaksi ASC" ); $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows == 0) {
        echo "<script language='javascript'>alert('Tidak Ada Transaksi');window.location.href = 'index.php';</script>";
    }else{
		$file_pointer = "pdf/".$bulan.".pdf"; 

		$pdf = new FPDF('p','mm','A4');
		$pdf -> SetFont('Arial','B',14);
		$pdf -> AddPage();
		$pdf->Rect(5, 5, 200, 287, 'D');
		//Cell(width , height , text , border , endline , [align])
		$pdf -> SetFont('Arial','B',14);
		$pdf -> Cell(190, 10, 'DAFTAR TRANSAKSI', 0 , 1, 'C');
		$pdf -> SetFont('Arial','B',11);
		$pdf -> Cell(190, 7.5, 'No.'.$bulan , 0 , 1, 'C');
		$pdf -> Cell(190, 7.5, '', 0 , 1, 'C');
		$pdf -> Cell(40, 5, '', 0 , 1);
		$pdf -> SetFont('Arial','B',10);
		
		$pdf -> Cell(25, 5, 'ID Transaksi', 1 , 0,'C'); 
		$pdf -> Cell(15, 5, 'Tanggal', 1 , 0,'C'); 
		$pdf -> Cell(15, 5, 'Akun', 1 , 0, 'C'); 
		$pdf -> Cell(35, 5, 'Nama Karyawan', 1 , 0, 'C'); 
		$pdf -> Cell(60, 5, 'Keterangan', 1 , 0,'C'); 
		$pdf -> Cell(20, 5, 'Debet', 1 , 0,'C'); 
		$pdf -> Cell(20, 5, 'Kredit', 1 , 1,'C');
		
		$pdf -> SetFont('Arial','',10);
		
		while($row = mysqli_fetch_assoc($result)) {
        $idtransaksi = $row["idtransaksi"];
        $kodeakun = $row["kodeakun"];
        $karyawan = $row["karyawan"];
		$namakaryawan ="--Pengisian Saldo--";
		
		$stmt2 = $con->prepare( "SELECT nama FROM karyawan  WHERE idkaryawan = '$karyawan' " ); $stmt2->execute() or die($con->error);
		$result2 = $stmt2->get_result(); 
			while($row2 = mysqli_fetch_assoc($result2)) {$namakaryawan = $row2["nama"];} 
			
        $jumlah = $row["jumlah"];
		$keterangan = $row["keterangan"];
		$kredit = $row["kredit"]; 
		$tanggal=   substr($idtransaksi, 0, 6);
		$tanggal=   substr_replace($tanggal, '-', 2, 0);
		$tanggal=   substr_replace($tanggal, '-', 5, 0);
		
		$pdf -> Cell(25, 5, $idtransaksi , 1 , 0,'C'); 
		$pdf -> Cell(15, 5, $tanggal , 1 , 0,'C');
		$pdf -> Cell(15, 5, $kodeakun , 1 , 0, 'C'); 
		$pdf -> Cell(35, 5, $namakaryawan, 1 , 0,'C'); 
		$pdf -> Cell(60, 5, $keterangan, 1 , 0); 
		if($kredit == 0){
			$pdf -> Cell(20, 5, number_format($jumlah) , 1 , 0,'R'); 
			$pdf -> Cell(20, 5, '', 1 , 1);
			$jumlahdebet = $jumlahdebet + $jumlah;
		}else{
			$pdf -> Cell(20, 5, '' , 1 , 0); 
			$pdf -> Cell(20, 5, number_format($jumlah) , 1 , 1,'R');
			$jumlahkredit = $jumlahkredit + $jumlah;
		}
		}
		$pdf -> Cell(95, 15, '', 0, 0);
		$pdf -> Cell(60,5, 'Total', 1, 0, 'C');
		$pdf -> Cell(20, 5, number_format($jumlahdebet), 1 , 0,'R');
		$pdf -> Cell(20, 5, number_format($jumlahkredit), 1 , 1,'R');
		$pdf -> Cell(30, 15, '', 0 , 1);
		$pdf -> Cell(130, 5, '', 0 , 0); $pdf -> Cell(30, 5, 'Dibuat Oleh', 0 , 1);
		$pdf -> Cell(30, 25, '', 0 , 1);
		$pdf -> Cell(130, 5, '', 0 , 0); $pdf -> Cell(30, 5, '(Admin Kasir)', 0 , 1);

		$pdf -> Output();
	}
	$con->close();

/*
for($i=0;$i<sizeof($jurnal[0]);$i++){
    $j=$i+1;
    $pdf -> Cell(10, 5, $j , 1 , 0); 
    $pdf -> Cell(40, 5, $jurnal[0][$i], 1 , 0); 
    $pdf -> Cell(80, 5, $jurnal[2][$i], 1 , 0); 
    $pdf -> Cell(60, 5, $jurnal[1][$i], 1 , 1); 
}
*/

echo "<script language='javascript'>alert('PDF Berhasil Dibuat');window.location.href = 'index.php';</script>";

?>