<?php

require('db-connect.php');

$test_query = "SELECT Filme.titulo FROM Filme ORDER BY Filme.titulo";

$result = mysqli_query($link, $test_query);

#print_r($result);

$to_encode = array();
$tj = "[";

$n=0;

#echo $result->num_rows;

while($row = mysqli_fetch_assoc($result)) {
    $n=$n+1;

 #   echo $n;
     #print_r($row);
     #array_push($to_encode,$row.array_values(1));
     #array_push($to_encode,$row[0]);
 	#array_push($to_encode,$row.titulo);
 	#array_push($to_encode,$row[titulo]);
 	array_push($to_encode,"'".$row['titulo']."'");
 	
 	
 	$tj = $tj.'"'.$row['titulo'].'"';
 	if($n<$result->num_rows)
 		$tj = $tj.",";
 }
$tj = $tj."];";

#echo '<pre>'; print_r($to_encode); echo '</pre>';
#https://stackoverflow.com/questions/7229027/how-to-get-data-to-javascript-from-php-using-json-encode
#var_dump($to_encode);
#print_r($to_encode);
#print_r($to_encode);

#$arr = array('a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5);
#print_r($arr);
#echo json_encode($arr);

echo $tj;

#echo json_encode($tj);

#echo json_encode($to_encode);
#print_r($to_encode); 

mysqli_close($link);
?>

