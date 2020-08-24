<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
require 'PHPMailer/src/Exception.php';
require('koneksi.php');
date_default_timezone_set("Asia/Bangkok");
$idtransaksi = strval(date('ymdHis', time()));

error_reporting(-1);
ini_set('display_errors', 'On');
set_error_handler("var_dump");
echo PHP_VERSION;

$SMTPSecure = 'ssl';
$Host = 'smtp.gmail.com';
$Port = '465';
$mailUsername = 'alvien.chandra05@gmail.com';
$mailPassword = 'vienchan1210';
$SetFrom = 'noreply-alvien.chandra05@gmail.com';

		//require_once('PHPMailer/PHPMailerAutoload.php');
		//$mail = new PHPMailer();
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
		$mail->Subject = 'No-Reply: Mohon dibukakan cek sebesar ';
		$mail->Body = "Dear, mohon dibukakan cek sebesar untuk mengisi kas kecil (".$idtransaksi.")";
		//$mail->addAttachment($file_pointer);
		$mail->AddAddress("alvien@sawitindo.com");
		//$mail->AddAddress("erwin_esgs@yahoo.com");
		$mail->send();

?>