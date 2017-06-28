<?php
# Fill our vars and run on cli
# $ php -f db-connect-test.php

$dbname = 'cinemaecidades';
$dbuser = 'cinemaecidades';
$dbpass = '';
$dbhost = 'cinemaecidades.dsi.uminho.pt';

$link = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");
mysqli_select_db($link, $dbname) or die("Could not open the db '$dbname'");

?>
