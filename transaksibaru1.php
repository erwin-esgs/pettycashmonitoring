<?php
session_start();

/*use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
require 'PHPMailer/src/Exception.php';
*/
require('koneksi.php');

date_default_timezone_set("Asia/Bangkok");
$idtransaksi = strval(date('ymdHis', time()));
$kodeakun = $_POST["kodeakun"];
$karyawan = $_POST["karyawan"];
$jumlah = strval($_POST["jumlah"]);
$keterangan = $_POST["keterangan"];
$kredit = 1;
$statustrans = 2;
$newstatus = 1;
$saldo = strval($_POST["saldo"]);
$username = $_SESSION["username"];

$newwidth = 1366;
$newheight = 768;

$ext = ".jpg";
$fileloc = "img/";
$image = $idtransaksi.$ext;
$tmpname = $_FILES['image']['tmp_name'];

$terupload = move_uploaded_file($tmpname, $fileloc.$image);

	$con = new mysqli($host, $dbid, $dbpass, $dbname);
	$stmt = $con->prepare( "INSERT INTO transaksi (idtransaksi, kodeakun, karyawan, jumlah, keterangan, kredit, statustrans, username) 
							VALUES ( ? , ? , ? , ? , ? , ? , ? , ?) ");
	$stmt->bind_param("sssisiis", $idtransaksi, $kodeakun, $karyawan, $jumlah, $keterangan , $kredit , $statustrans , $username); $stmt->execute();
	$result = $stmt->get_result();
	
	
	$saldo = $saldo - $jumlah;
	$stmt = $con->prepare( "UPDATE saldo SET saldo = ? " );
	$stmt->bind_param("i",  $saldo); 
	$result = $stmt->execute();
	
	if ($saldo < $minsaldo){

		$stmt = $con->prepare( "SELECT idtransaksi, jumlah FROM transaksi WHERE statustrans = ? " );
		$stmt->bind_param("s", $statustrans); 
		$result = $stmt->execute();
		$result = $stmt->get_result();

		require 'fpdf/fpdf.php';
		$file_pointer = "pdf/".$idtransaksi.".pdf"; 
		$x=10;$y=20;$z=90;$i=1;
		$pdf = new FPDF('p','mm','A4');
		$pdf -> SetFont('Arial','B',14);
		$pdf -> AddPage();

		$total=0;
		while($row = mysqli_fetch_assoc($result)) {	
			$total=$total+$row["jumlah"];
			$image = "img/".$row["idtransaksi"].".jpg";
			if($i%8 == 1 && $i != 1){
				$pdf -> AddPage();
				$x=10;$y=20;$z=90;
			}
			if($i%2 != 0 || $i == 1){
				$pdf -> Image($image,$x,$y,$z); $x=$x+100;
			}else{
				$pdf -> Image($image,$x,$y,$z); $x=$x-100; $y=$y+60;
			}
			$i=$i+1;
			
		}
		$pdf -> Output($file_pointer,'F');
		$stmt = $con->prepare( "UPDATE transaksi SET statustrans = ?   WHERE  statustrans = ? " );
		$stmt->bind_param("ii",  $newstatus, $statustrans); 
		$result = $stmt->execute();
		
		//require_once('PHPMailer/PHPMailerAutoload.php');
		/*
		$mail = new PHPMailer(true);
		$mail->isSMTP();
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = $SMTPSecure;
		$mail->Host = $Host;
		$mail->Port = $Port;
		$mail->isHTML();
		$mail->Username = $mailUsername;
		$mail->Password = $mailPassword;
		$mail->SetFrom($SetFrom);
		$mail->Subject = 'No-Reply: Mohon Dibukakan Cek Sebesar Rp '.number_format($total).'';
		$mail->Body = "Dear Bag.Keuangan, <br><br> Mohon dibukakan cek sebesar Rp ".number_format($total)." untuk mengisi kembali danakas kecil (".$idtransaksi."). Terima kasih. <br><br> Regards, <br> Kasir Kas Kecil";
		$mail->addAttachment($file_pointer);
		$mail->AddAddress("alvien@sawitindo.com");
		$mail->Send();
		*/
		require_once('library-email/function.php');
		$to       = 'alvien@sawitindo.com';
        $subject  = 'No-Reply: Mohon Dibukakan Cek Sebesar Rp '.number_format($total).'';
        $message  = "Dear Bag.Keuangan, <br><br> Mohon dibukakan cek sebesar Rp ".number_format($total)." untuk mengisi kembali danakas kecil (".$idtransaksi."). Terima kasih. <br><br> Regards, <br> Kasir Kas Kecil";
        
        smtp_mail($to, $subject, $message, '', '', 0, 0, true , $file_pointer);
		/*
		if (!unlink($file_pointer)) {  
			echo ("$file_pointer cannot be deleted due to an error");  
		}  
		else {  
			echo ("$file_pointer has been deleted");  
		}
		*/
	}
	
	$con->close();
if ($result ) {
    echo "<script language='javascript'>alert('Transaksi Berhasil Disimpan');window.location.href = 'index.php';</script>";
} else {
    echo "<script language='javascript'>alert('Transaksi Gagal Disimpan');window.location.href = 'index.php';</script>";
}

?>