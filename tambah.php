<?php
error_reporting(0);

include "koneksi.php";

$b_tinggi = $_POST['tinggi'];
$b_berat = $_POST['berat'];
$b_status = $_POST['status'];


if (empty($b_tinggi) or empty($b_berat) or empty($b_status)) 
{
	echo "<script>alert('Nama something belum anda isi');window.location = 'javascript:history.go(-1)'; </script>";
}


else
{
	mysql_query("INSERT INTO data (tinggi,
								berat,
								status) 
						VALUES ('$b_tinggi',
								'$b_berat',
								'$b_status')");

	echo "<script>alert('Sukses');window.location = 'javascript:history.go(-1)'; </script>";

}

?>