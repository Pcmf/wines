<?php
    session_start();
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<!DOCTYPE html>
<html lang="PT-PT">
<head>
  <title>FB - representations</title>
  <link rel="shortcut icon" href="favicon.ico">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="angular/angular.js" type="text/javascript"></script>
  <script src="angular/angular-ui.js" type="text/javascript"></script>
  <script src="angular/angular-route.js" type="text/javascript"></script>
  <script src="angular/angular-resource.js" type="text/javascript"></script>
  <script src="angular/angular-file-upload.js" type="text/javascript"></script>
        <!--a linha a baixo é utilizada para mostrar o modal-->
        <link href="boot/uibootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js"></script>   
        <script src="angular/bootstrap.js" type="text/javascript"></script>
  <link href="angular/uibootstrap.css" rel="stylesheet" type="text/css"/>
  <link href="css/css.css" rel="stylesheet" type="text/css"/>
  <script src="js/appWines.js" type="text/javascript"></script>
  <script src="man/appManWines.js" type="text/javascript"></script>
  <script src="man/servicesMan.js" type="text/javascript"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .bnt-black{
        background-color: black;
    }
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
</head>
<body ng-app="winesApp">

<nav class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar bnt-black"></span>
        <span class="icon-bar bnt-black"></span>                        
        <span class="icon-bar bnt-black"></span>                        
      </button>
        <a href="#">
            <img src="galery/logo2.1.fw.png" class="logoFB"/>
        </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
          <li><a href="#/inicio"><i class="fa fa-home"> Inicio</i></a></li>
          <li><a href="#/produtos/%20"><i class="fa fa-th-list"> Catálogo</i></a></li>
          <li><a href="#/shopCart/"><i class="fa fa-shopping-cart" style="color:{{faColor}};"></i></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="index.php#/inicio/"><img src="galery/flagPT.jpg" class="flagxSmall" alt="Português"/></a></li>
          <li><a href="index_EN.php#/home/"><img src="galery/flagUK.png" class="flagxSmall" alt="Inglês"/></a></li>
          <li><a href="index_FR.php#/premier/"><img src="galery/flagFR.png" class="flagxSmall" alt="Francês"/></a></li>
          <li><a href="index_BE.php#/huis/"><img src="galery/flagBE.png" class="flagxSmall" alt="Nerlandês"/></a></li>
          <li ng-controller="loginController"><a ng-click="showLoginModal()"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
    <div ng-view=""></div>
<br/><br/>
<footer class="w3-container w3-center w3-light-gray">
    <hr/>
    <div class="w3-row">
        <div class="w3-col l1">&nbsp;</div>
        <div class="w3-col l3">
            <ul>
                <li>Penafiel - Portugal</li>
                <li>+351 964 060 747</li>
            </ul>
        </div>
        <div class="w3-col l4">
                <p>FB Reprentações - Penafiel / Gent</p>
        </div>
        <div class="w3-col l4">
            <ul>
                <li>Gent - Belgium</li>
                <li><+32 468 238 754</li>
                <li>0545 798 214</li>
            </ul>
        </div>
        <div class="w3-col l1">&nbsp;</div>
    </div>
</footer>
    
    <!--  LOGIN Modal-->
    <script type="text/ng-template" id="modalLogin.html">
        <div class="modal-header">
            <h3 class="modal-title">
                Login
                <span class="closeModal" ng-click="closeModal()">X</span>
            </h3>
        </div>
        <div class="modal-body">
            <div class="loginDiv">
            <form ng-submit="login(u)">
                <label>Email: </label>
                <input type="email" class="inputLong" ng-model="u.emailLogin" required="required"/>
                <br/><br/>
                <label>Password: </label>
                <input type="password" class="inputShort" ng-model="u.passLogin" required="required"/>
                <br/><br/>
                <button type="submit" class="w3-btn w3-red">Login</button>
                <em class="w3-text-red w3-small" ng-if="error">Email ou password errados!</em>
            <form>
            </div>
        </div>
        <div class="modal-footer">
           <!-- 
           <em class="w3-small">Se ainda não está registado clique <a href="" ng-click="registerClient()"><b>aqui</b>.</a></em>
           -->
        </div>
    </script>        
    
</body>
</html>
