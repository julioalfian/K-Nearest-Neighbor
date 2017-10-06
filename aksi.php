<?php
error_reporting(0);

include "koneksi.php";

$b_x = $_POST['x'];
$b_y = $_POST['y'];


if (empty($b_x) or empty($b_y))
{
	echo "<script>
				alert('Ada yang belum anda isi');
				window.location = 'javascript:history.go(-1)'; 
		</script>";
}
else
{
	//Membaca jumlah baris data pada database
	$sql = mysql_query("SELECT * FROM data ORDER BY id ASC");
	$numrows = mysql_num_rows($sql);

	//Menentukan nilai K
	/*$k=0.3 * $numrows;
	$k=round($k);
	$r=$k % 2;
	if($r!=0)
	{
		$k=$k+1;
	}
	else
	{
		$k=$k;
	}*/

	$k=5; 

	echo "<b>Nilai K adalah sebesar $k </b><br><br>";

	//Perhitungan dengan KNN
	for ($i=1; $i <= $numrows; $i++)
	{	
		$sql1 = mysql_query("SELECT * FROM data Where id = $i");
		while($data = mysql_fetch_array($sql1))
		{
			//Pengurangan(KNN)
			$v1 = $b_x - $data[x];
			$v2 = $b_y - $data[y];

			
			//Pengkuadratan(KNN)
			$hit1 = (pow($v1,2)) + (pow($v2,2));
			
			//Pengakaran(KNN)
			$hit2 = sqrt($hit1);
			
			//Penyimpanan perhitungan ke database sementara
			mysql_query("INSERT INTO sementara (id,
												jarak,
												x,
												y,
												status)
										VALUES ('$i',
												'$hit2',
												'$data[x]',
												'$data[y]',
												'$data[status]')");
		}	
	}

	
	
	//data yang sudah d sorting dari data pertama sampai data nilai K
	$sql3 = mysql_query("SELECT * FROM  `sementara` ORDER BY  `sementara`.`jarak` ASC LIMIT 0 , $k");
	$x=1;
	
	while($data = mysql_fetch_array($sql3))
		{			
			//memasukkan data yang sudah di sorting mulai dari pertama sampai data nilai k ke dalam database sementara
			mysql_query("INSERT INTO urut (id,
										jarak,
										x,
										y,
										status)
								VALUES ('$x',
										'$data[jarak]',
										'$data[x]',
										'$data[y]',
										'$data[status]')");
								$x=$x+1;
		}	
	

	$sqlrtes = mysql_query("SELECT * FROM  urut ORDER BY id ASC LIMIT 0 , 1");
	while($datates = mysql_fetch_array($sqlrtes))
	{
		
			//mencari hasil
			$sqlrx = mysql_query("SELECT * FROM  urut ORDER BY id ASC");
			//$hasil_nam = mysql_fetch_array($sql_nam);
			while($datax = mysql_fetch_array($sqlrx))
			{
				if($datax['jarak']=='0')
				{
					$Status = $datax['status'];
					$x = $datax['x'];
					$y = $datax['y'];
					
				echo "<br>Terklasifikasi sebagai Kelas <b>$Status</b>, dengan X <b>$x</b>, dan Y <b>$y</b></b>"; 	
					break;	
				}
				else
				{
					$Status = $datax['status'];
					$x = $datax['x'];
					$y = $datax['y'];

				echo "<br>Terklasifikasi sebagai Kelas <b>$Status</b>, dengan X <b>$x</b>, dan Y <b>$y</b></b>";  
					break;
				}
			}		
		
	}	




	//langkah terakhir menghapus histori perhitungan pada database
	$sqls = mysql_query("SELECT * FROM sementara ORDER BY id ASC");
	$numrows1 = mysql_num_rows($sqls);
	for ($i=1; $i <= $numrows1; $i++)
	{

		mysql_query("DELETE FROM sementara WHERE id=$i");
	}


	$sql_urut = mysql_query("SELECT * FROM data ORDER BY id ASC");
	$numrows_urut = mysql_num_rows($sql_urut);
	for ($i=1; $i <= $numrows_urut; $i++)
	{
		mysql_query("DELETE FROM urut WHERE id=$i");
	}


}
?>