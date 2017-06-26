<?php

require('db-connect.php');

$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php

$locais_query = "SELECT Pais.nome_pais,`Local`.`nome_local` FROM Filme, Pais, `Local`, Filme2Local where Filme.cod_filme = Filme2Local.cod_filme and `Local`.`cod_local` = Filme2Local.cod_local and `Local`.`cod_pais` = Pais.cod_pais and Filme.cod_filme=$codF order by Pais.nome_pais"; 

$result_locais = mysqli_query($link, $locais_query);

#print_r($result_locais);#1

// Open your drop down box
$tblCnt1 = 0;
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_locais)) {
    $tblCnt1++;
  	
   	echo "<tr>";
   	echo "<td>".$tbl1['0']."</td>";
    echo "<td>".$tbl1['1']."</td>";
    echo "</tr>";
}

#echo '</select>';// Close your drop down box
mysqli_close($link);

?>