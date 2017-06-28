<!DOCTYPE html>
<!--
   Transit by TEMPLATED
   templated.co @templatedco
   Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
   -->
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>Cinema&Cidades</title>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
      <!-- Include jQuery library -->
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <!-- Include Google Map library -->    
      <script src="https://maps.googleapis.com/maps/api/js"></script>
      <script src="js/jquery.min.js"></script>
      <script src="js/skel.min.js"></script>
      <script src="js/skel-layers.min.js"></script>
      <script src="js/init.js"></script>
      <noscript>
         <link rel="stylesheet" href="css/skel.css" />
         <link rel="stylesheet" href="css/style.css" />
         <link rel="stylesheet" href="css/style-xlarge.css" />
      </noscript>
   </head>
   <body>
      <!-- Header -->
      <header id="header">
         <h1>Cinema&Cidades</a></h1>
         <nav id="nav">
            <ul>
               <li><a href="index.html">Home</a></li>
               <li><a href="pesquisa.php">Pesquisar</a></li>
               <li><a href="#">Contactos</a></li>
            </ul>
            </ul>
         </nav>
      </header>
      <!-- Main -->
      <section id="main" class="wrapper">
         <div class="container">
            <header class="major">
               <?php 
                  require('db-connect.php');
                  #$filme = $_POST['filme'];
                  #$titulo="'".$filme."'";
                  $titulo="'Snatch'";
                  $cod_query = "SELECT Filme.cod_filme from Filme WHERE Filme.titulo=$titulo";
                  
                  #echo $pontuacao_query;
                  
                  $result_cod = mysqli_query($link, $cod_query);
                  
                  $tblCnt1 = 0;
                  
                  // Loop through the query results, outputing the options one by one
                  while($tbl1 = mysqli_fetch_array($result_cod)) {
                  $tblCnt1++;
                  $codF = $tbl1['0'];
                  }
                  
                  #echo $codF;
                  mysqli_close($link);
                  
                  #$codF =4;
                  ?>
               <h2><?php echo $titulo; ?></h2>
               <!--FAZER SCRIPT PARA O TITULO DO FILME-->
               <?php require('imdbRating.php') ?>
            </header>
            <!-- Info Básica -->
            <section>
               <div  class="row uniform 50%">
                  <div class="4u">
                     <?php require('infoBasica_Filme.php') ?>
                  </div>
                  <div class="4u">
                     <iframe width="925" height="400" src="<?php require('linkyoutube.php') ?>">
                     </iframe>
                  </div>
               </div>
            </section>
            <hr />
            <!-- GoogleMaps e Tabela de Locais -->
            <section>
               <h2>Locais presentes neste filme:</h2>
               <div class="container_box">
                  <style>
                     h1{margin: 5px 0px; font-family: arial;font-size: 22px;}
                     p{margin: 5px 0px; font-family: arial; font-size: 14px;}
                     .container_box{width:1400px; margin:0 auto; margin-top:40px;}
                     .clearfix{clear: both;}
                  </style>
                  <div class="clearfix">
                     <!--<h1>Google Map With Marker</h1>-->
                     <div id="map" style="width: 100%;height: 400px;margin-bottom: 50px;border-radius: 5px;"></div>
                     <script type="text/javascript">
                        var locations = <?php require 'locaisFilme.php' ?>;
                        
                        var map = new google.maps.Map(document.getElementById('map'), {
                          zoom: 3,
                          center: new google.maps.LatLng(55.012153,-3.446869),
                          mapTypeId: google.maps.MapTypeId.ROADMAP
                        });
                        
                        var infowindow = new google.maps.InfoWindow();
                        
                        var marker, i;
                        
                        for (i = 0; i < locations.length; i++) { 
                          marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                            map: map
                          });
                        
                          google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                              infowindow.setContent(locations[i][0]);
                              infowindow.open(map, marker);
                            }
                          })(marker, i));
                        }
                     </script>
                  </div>
               </div>
               <h3></h3>
               <h4></h4>
               <div class="table-wrapper">
                  <table>
                     <thead>
                        <tr>
                           <th>País</th>
                           <th>Nome do local</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php require 'tabelalocais.php' ?>
                     </tbody>
                  </table>
               </div>
               <hr />
            </section>
            <!-- Tabela de Atores -->
            <section>
               <h3>Elenco</h3>
               <h4></h4>
               <div class="table-wrapper">
                  <table>
                     <thead>
                        <tr>
                           <th>Ator</th>
                           <th>Perfil no IMDb</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php require 'atoresFilme.php' ?>
                     </tbody>
                  </table>
               </div>
            </section>
         </div>
      </section>
      <!-- Footer -->
      <footer id="footer">
         <div class="container">
            <div class="row">
               <div class="8u 12u$(medium)">
                  <ul class="copyright">
                     <li>&copy; CinemaeCidades 2017. All rights reserved.</li>
                  </ul>
               </div>
            </div>
         </div>
      </footer>
   </body>
</html>