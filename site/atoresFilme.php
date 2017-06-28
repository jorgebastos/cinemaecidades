<?php

require('db-connect.php');

#$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php

$atores_query = "SELECT Ator.nome_ator, Link.link from Ator, Link, Ator2Link, Filme2Ator, Filme where Ator.cod_ator=Ator2Link.cod_ator and Link.cod_link = Ator2Link.cod_link and Filme.cod_filme = Filme2Ator.cod_filme and  Ator.cod_ator = Filme2Ator.cod_ator and Link.cod_tipoLink=12 and Filme.cod_filme=$codF ORDER by Ator.nome_ator;"; 

$result_atores = mysqli_query($link, $atores_query);

#print_r($result_locais);#1

// Open your drop down box
$tblCnt1 = 0;
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_atores)) {
    $tblCnt1++;
  	
   	echo "<tr>";
   	echo "<td>".$tbl1['0']."</td>";
    echo '<td><a href="'.$tbl1['1'].'">'.$tbl1['1'].'</a></td>';
    echo "</tr>";
}

#echo '</select>';// Close your drop down box
mysqli_close($link);


#<td><a href="http://www.imdb.com/name/nm0915989">http://www.imdb.com/name/nm0915989</a></td>

?>