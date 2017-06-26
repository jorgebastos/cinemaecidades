<?php
# Fill our vars and run on cli
# $ php -f db-connect-test.php
require('db-connect.php');
#$dbname = 'cinemaecidades';
#$dbuser = 'cinemaecidades';
#$dbpass = 'jorgepbastos8';
#$dbhost = 'cinemaecidades.dsi.uminho.pt';

#$link = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");
#mysqli_select_db($link, $dbname) or die("Could not open the db '$dbname'");


$test_query = "SELECT DataRealizacao.dataRealizacao FROM DataRealizacao ORDER BY DataRealizacao.dataRealizacao";

$result = mysqli_query($link, $test_query);

#echo '<select name="category" id="ano_realizacao">'; // Open your drop down box
$tblCnt = 0;
// Loop through the query results, outputing the options one by one
while($tbl = mysqli_fetch_array($result)) {
    $tblCnt++;
  	echo '<option value="'.$tbl[0].'">'.$tbl['0'].'</option>';
}

#echo '</select>';// Close your drop down box

mysqli_close($link);
?>