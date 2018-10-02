<?php

/* 
 * Tem de estar registado para poder entrar nesta pagina
 * A entrada é feita a partir da pagina de entrada.
 * 
 * 
 */

?>
<!DOCTYPE html>
<html lang="nl-NL">
<head>
  <title>FB - manutenção</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="../angular/angular.js" type="text/javascript"></script>
  <script src="../angular/angular-ui.js" type="text/javascript"></script>
  <script src="../angular/angular-route.js" type="text/javascript"></script>
  <script src="../angular/angular-resource.js" type="text/javascript"></script>
  <script src="../angular/angular-file-upload.js" type="text/javascript"></script>
  <script src="../angular/q.js" type="text/javascript"></script>
        <!--a linha a baixo é utilizada para mostrar o modal-->
        <link href="../angular/uibootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        
  <link href="../css/css.css" rel="stylesheet" type="text/css"/>
  <link href="../css/cssMan.css" rel="stylesheet" type="text/css"/>
  <script src="appManWines.js" type="text/javascript"></script>
  <script src="servicesMan.js" type="text/javascript"></script>
  <script src="../js/appWines.js" type="text/javascript"></script>
  <script src="angular-file-upload.js" type="text/javascript"></script>
</head>

<body ng-app="winesMan">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li><a href="#/list">Listagem</a></li>
                    <li><a href="#/others">Outros produtos</a></li>
                    <li><a href="#/contacts">Contactos</a></li>
                    <li><a href="#/orders">Encomendas</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            Tabelas <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#/region">Regiões</a></li>
                            <li><a href="#/locality">Localidade</a></li>
                            <li><a href="#/producer">Produtor</a></li>
                            <li><a href="#/soil">Solo</a></li>
                            <li><a href="#/winetype">Tipo de vinho</a></li>
                            <li><a href="#/producttype">Tipo de produto</a></li>
                            <li><a href="#/oenologist">Enologo</a></li>
                            <li><a href="#/grape">Castas</a></li>
                            <li><a href="#/packing">Vasilhame</a></li>
                        </ul>
                    </li>
                    <li ng-controller="logOutCtrl"><a ng-click="logOut()">Sair</a>
                </ul>
            </div>
    
        <div ng-view=""></div>
    
    </body>
</html>
