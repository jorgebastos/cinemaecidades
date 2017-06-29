<!DOCTYPE html>
<!--
   Transit by TEMPLATED
   templated.co @templatedco
   Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
   -->
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>Cinema&Cidades - Pesquisa</title>
      <meta http-equiv="content-type" content="text/html; charset=utf-8" />
      <meta name="description" content="" />
      <meta name="keywords" content="" />
      <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">-->
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
         <h1><a href="#">Cinema&Cidades</a></h1>
         <nav id="nav">
            <ul>
               <li><a href="http://cinemaecidades.dsi.uminho.pt/"></a>Home</li>
               <li><a href="#">Contactos</a></li>
            </ul>
            </ul>
         </nav>
      </header>
      <!-- Main -->
      <section id="main" class="wrapper">
         <div class="container">
            <header class="major">
               <h2>Pesquise por:</h2>
               <p></p>
            </header>
            <!-- Text -->
            <section class="-3u 12u(4)">
               <h2>Filme(Título): </h2>
               <div class="6u 12u(4)">
                  <form action="filme.php" method=post>
                     <input type="text" name="filme" id="filme" value="<?php echo $filme?>" placeholder="Título do Filme" onclick="autoSugest() " />
                     <script type="text/javascript">
                        function autoSugest(){
                        //var tj= '<?php //require 'query.php' ?>';
                        //console.log(tj);
                        var queries = <?php require 'query.php' ?>;
                           console.log("Filmes na BD"+queries);
                        //apos receber o array, fazer o autocomplete.
                        
                        /*$.ajax ( {
                            url: "query.php",
                            dataType: "json",
                            success: function ( data, textStatus, jqXHR ) {
                                // process the data, you only need the "data" argument
                               // jQuery will automatically parse the JSON for you!                      
                            }
                        } );*/
                        $( function() {
                           var availableTags = queries;
                           $( "#filme" ).autocomplete({
                            minLength: 1,
                            delay: 10,
                            source: availableTags
                             });
                             } );
                        /*var json_obj = jQuery.parseJSON ( ' + <?php// echo $json; ?> + ' );*/
                        //var json_obj = <?php //require 'query.php'; ?>
                        
                        
                        $('#filme').keypress(function (e) {
                        
                        if (e.keyCode == 13) { // when user press ENTER
                           
                                    var filmeEscolhido = $('#filme').val();
                                 
                                    console.log("Enter pressionado, valor:"+filmeEscolhido)
                                    location.href="/home/jorge/Desktop/CinemaeCidades/Website/site/elements.html";
                        
                                 };
                               } // else
                           );
                        }
                     </script>
                  </form>
               </div>
               <!--<hr /> --><br>
               <h2>Local/Cidade/País: </h2>
               <div class="6u 12u(4)">
                  <input type="text" name="name" id="local" value="" placeholder="Nome do local, cidade ou país" />
               </div>
               <!--<hr /> --><br>
               <h2>Ano de realização: </h2>
               <div class="6u 12u$(4)">
                  <div class="select-wrapper">
                     <select name="category" id="ano_realizacao">
                     <?php require('pesquisa-dropdown.php') ?>
                     </select>
                  </div>
               </div>
               <!--<hr /> --><br>
               <h2>Realizador: </h2>
               <div class="6u 12u(4)">
                  <input type="text" name="name" id="realizador" value="" placeholder="Nome do realizador" />
               </div>
               <!--<hr /> --><br>
            </section>
         </div>
      </section>
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