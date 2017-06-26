<?php

require('db-connect.php');

$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php

$locais_query = "select `Local`.`nome_local`, `Local`.`latitude`,`Local`.`longitude` FROM `Local`, Filme, Filme2Local where Filme2Local.cod_local = `Local`.`cod_local` and Filme2Local.cod_filme = Filme.cod_filme and Filme.cod_filme=$codF"; 

$result_locais = mysqli_query($link, $locais_query);

#print_r($result_locais);#1

// Open your drop down box

$locaisFinal = "[";
$n=0;

$tblCnt1 = 0;
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_locais)) {
    $tblCnt1++;
  	
    $n=$n+1;
    $locaisFinal = $locaisFinal."['".$tbl1['0']."',".$tbl1['1'].",".$tbl1['2']."]";

    if($n<$result_locais->num_rows)
    $locaisFinal = $locaisFinal.",";

}

$locaisFinal = $locaisFinal."];";
echo $locaisFinal;
#echo '</select>';// Close your drop down box
mysqli_close($link);

?>