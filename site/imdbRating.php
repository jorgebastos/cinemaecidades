<?php

require('db-connect.php');

$codF = 11; #depois mudar para o codigo do filme pesquisado, vem do script recebeFilme.php



$pontuacao_query = "SELECT PontuacaoIMDb.pontuacao from PontuacaoIMDb, Filme where PontuacaoIMDb.cod_pontuacao=Filme.cod_pontuacao and Filme.cod_filme=$codF";

$link_filme = "SELECT Link.link FROM Filme, Link, Filme2Link where Filme.cod_filme = Filme2Link.cod_filme and Link.cod_link = Filme2Link.cod_link and Link.cod_tipoLink=1 and Filme.cod_filme=$codF";

$result_pontuacao = mysqli_query($link, $pontuacao_query);
$result_linkFilme = mysqli_query($link, $link_filme);

#print_r($result_pontuacao);#5

$tblCnt1 = 0;
$imdb_linkfilme = '';
// Loop through the query results, outputing the options one by one
while($tbl1 = mysqli_fetch_array($result_linkFilme)) {
    $tblCnt1++;
    $imdb_linkfilme = $imdb_linkfilme.'<section><h2><img src="images/pic99.png"></img><a href="'.$tbl1['0'].'">';
}




$tblCnt2 = 0;
while($tbl2 = mysqli_fetch_array($result_pontuacao)) {
    $tblCnt2++;
  	$imdb_linkfilme = $imdb_linkfilme.$tbl2['0'].'/10 <img src="images/star.png"></img></a></h2></section>';
}

echo $imdb_linkfilme;
mysqli_close($link);

?>