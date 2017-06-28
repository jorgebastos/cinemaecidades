<?php

require('db-connect.php');

#$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php

$dataRealizacao_query = "SELECT DataRealizacao.dataRealizacao FROM DataRealizacao, Filme WHERE DataRealizacao.cod_dataRealizacao = Filme.cod_dataRealizacao and Filme.cod_filme=$codF"; 

$genero_query = "SELECT Genero.descricao_genero from Genero, Filme where Genero.cod_genero = Filme.cod_genero and Filme.cod_filme=$codF";

$realizador_query = "SELECT Realizador.nome_realizador FROM Filme, Realizador WHERE Realizador.cod_realizador=Filme.cod_realizador and Filme.cod_filme=$codF";

$linkRealizador_query = "SELECT Link.link from Realizador, Filme, Link, Realizador2Link where Filme.cod_realizador=Realizador.cod_realizador and Realizador2Link.cod_realizador = Realizador.cod_realizador and Realizador2Link.cod_link = Link.cod_link and Filme.cod_filme=$codF";

$pontuacao_query = "SELECT PontuacaoIMDb.pontuacao from PontuacaoIMDb, Filme where PontuacaoIMDb.cod_pontuacao=Filme.cod_pontuacao and Filme.cod_filme=$codF";

$linguaOriginal_query = "SELECT LinguaOriginal.linguaOriginal from Filme, LinguaOriginal where Filme.cod_linguaOriginal = LinguaOriginal.cod_linguaOriginal and Filme.cod_filme=$codF";


$result_dataRealizacao = mysqli_query($link, $dataRealizacao_query);
$result_genero = mysqli_query($link, $genero_query);
$result_realizador = mysqli_query($link, $realizador_query);
$result_linkRealizador = mysqli_query($link, $linkRealizador_query);
$result_pontuacao = mysqli_query($link, $pontuacao_query);
$result_linguaOriginal = mysqli_query($link, $linguaOriginal_query);



#print_r($result_dataRealizacao);#1
#print_r($result_genero);#2
#print_r($result_realizador);#4
#print_r($result_linkRealizador);#3
#print_r($result_pontuacao);#5
#print_r($result_linguaOriginal);#6

echo '<header>'; // Open your drop down box

echo '<h4>Data de Realização</h4>';

$tblCnt1 = 0;
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_dataRealizacao)) {
    $tblCnt1++;
  	echo '<li>'.$tbl1['0'].'</li> &nbsp';
}

echo '</header>';

echo '<header>'; // Open your drop down box

echo '<h4>Género</h4>';

$tblCnt2 = 0;
// Loop through the query results, outputing the options one by one
while($tbl2 = mysqli_fetch_array($result_genero)) {
    $tblCnt2++;
  	echo '<li>'.$tbl2['0'].'</li>&nbsp';
}
echo '</header>';



echo '<header>'; // Open your drop down box

echo '<h4>Realizador</h4>';
$realizadorcomLink='';

$tblCnt3 = 0;

// Loop through the query results, outputing the options one by one
while($tbl3 = mysqli_fetch_array($result_linkRealizador)) {
    $tblCnt3++;
  	$realizadorcomLink = '<li><a href="'.$tbl3[0].'">';
}

$tblCnt4 = 0;
// Loop through the query results, outputing the options one by one
while($tbl4 = mysqli_fetch_array($result_realizador)) {
    $tblCnt4++;
  	$realizadorcomLink = $realizadorcomLink.$tbl4['0'].'</a></li>&nbsp';
}

echo $realizadorcomLink;
echo '</header>';

echo '<header>'; // Open your drop down box

echo '<h4>Lingua Original</h4>';

#echo '<select name="category" id="ano_realizacao">'; // Open your drop down box
$tblCnt5 = 0;
// Loop through the query results, outputing the options one by one
while($tbl5 = mysqli_fetch_array($result_linguaOriginal)) {
    $tblCnt5++;
  	echo '<li>'.$tbl5['0'].'</li>&nbsp';
}

echo '<header>';


#echo '</select>';// Close your drop down box
mysqli_close($link);

?>