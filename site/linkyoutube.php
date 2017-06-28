<?php
require('db-connect.php');

#$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php

$youtube_query = "select Link.link from Link, Filme2Link, Filme where Filme.cod_filme = Filme2Link.cod_filme and Link.cod_link = Filme2Link.cod_link and Link.cod_tipoLink=4 and Filme.cod_filme=$codF;"; 

$result_youtube = mysqli_query($link, $youtube_query);

#print_r($result_locais);#1

// Open your drop down box
$tblCnt1 = 0;
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_youtube)) {
    $tblCnt1++;
  	
   	echo $tbl1['0'];
    
}

#echo '</select>';// Close your drop down box
mysqli_close($link);

?>