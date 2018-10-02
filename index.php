<?php
    session_start();
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<!DOCTYPE html>
<html lang="nl_NL"  xmlns:fb="http://ogp.me/ns/fb#">
<head>
  <title>Wijn uit Portugal</title>
  <link rel="shortcut icon" href="favicon.ico">

  <meta charset="utf-8">
  <meta name="description" content="Wijn uit Portugal aan de beste prijs">
  <meta name="keywords" content="wijn, wijnen, wijn uit Portugal,wijnen uit Portugal, portuguese wijnen,
        vinho do porto, port wijn, beste prijs port wijn, port wijn in gent, douro wijn gent,
        wijngaarden van de valleien van de Douro, douro wijn, alentejo wijn, vinho verde, portuguese wijnen in belgium,
        wijn aan de beste prijs,Afhankelijk van de beschikbaarheid, maar steeds volgens afspraak">
  <meta name="author" content="Pedro Mendes Ferreira">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="google-site-verification" content="nlGD9QYhJ3tZZHMo04Y1xFZA-AD5LThlNPlIs-4tetA" />
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Caveat+Brush|Francois+One|Patua+One|Teko" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="angular/angular.js" type="text/javascript"></script>
  <script src="angular/angular-ui.js" type="text/javascript"></script>
  <script src="angular/angular-route.js" type="text/javascript"></script>
  <script src="angular/angular-resource.js" type="text/javascript"></script>
  <script src="angular/angular-file-upload.js" type="text/javascript"></script>
        <!--a linha a baixo é utilizada para mostrar o modal-->
        <link href="angular/uibootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.js"></script>   
        <script src="angular/bootstrap.js" type="text/javascript"></script>
  <link href="angular/uibootstrap.css" rel="stylesheet" type="text/css"/>
  <script src="js/appWines.js" type="text/javascript"></script>
  <script src="man/appManWines.js" type="text/javascript"></script>
  <script src="man/servicesMan.js" type="text/javascript"></script>
  
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <link href="css/css.css" rel="stylesheet" type="text/css"/>
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
   <!--Facebook code--> 
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=128956594371251";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<header>
<nav class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar bnt-black"></span>
        <span class="icon-bar bnt-black"></span>                        
        <span class="icon-bar bnt-black"></span>                        
      </button>
        <a href="#/huis">
            <img src="galery/logo2.1.fw.png" class="logoFB"/>
        </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <h1 class="w3-center h1Header">Wijn uit Portugal</h1>  
      <ul class="nav navbar-nav">
          <li><a href="#/huis"><i class="fa fa-home"> Home</i></a></li>
          <li><a href="#/producten/%20"><i class="fa fa-th-list">Wijnen</i></a></li>
          <li><a href="#/otherProducten/%20"><i class="fa fa-th-list">Andere Producten</i></a></li>          
          <li><a href="#/shopCart_be/"><i class="fa fa-shopping-cart" style="color:{{faColor}};"> Shopcart</i></a></li>
          <li><a href="#/opmerkingen/"><i class="fa fa-comment" aria-hidden="true"> Opmerkingen</i></a></li>      
      </ul>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="index_pt.php#/inicio/"><img src="galery/flagPT.jpg" class="flagxSmall" alt="Português"/></a></li>
          <!--<li><a href="index_en.php#/home/"><img src="galery/flagUK.png" class="flagxSmall" alt="Inglês"/></a></li>-->
          <!--<li><a href="index_fr.php#/premier/"><img src="galery/flagFR.png" class="flagxSmall" alt="Francês"/></a></li>-->
          <li><a href="index.php#/huis/"><img src="galery/flagBE.png" class="flagxSmall" alt="Nerlandês"/></a></li>
          <li ng-controller="loginController"><a ng-click="showLoginModal()"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
</header>

<article ng-view=""></article>
<br/><br/>

<footer class="w3-container w3-center w3-light-gray">
    <hr/>
    <div class="w3-row">
        <div class="w3-col l1">&nbsp;</div>
        <address class="w3-col l3">
            <img src="http://cgi.wijn-fb.be/Count.exe?df=wijn-fb.be.visits&dd=e&pad=F"><br/><br/>
            <ul>
                <li>Penafiel - Portugal</li>
                <li><phone> +351 964 060 747</phone></li>
            </ul>
        </address>
        <div class="w3-col l4">
                <p>FB-Wijn - Gent / Penafiel</p>
                <div class="fb-like" data-href="http://wijn-fb.be" data-layout="standard" data-action="like"
                    ng-app=""data-size="small" data-show-faces="true" data-share="true">
                </div>
        </div>
        <address class="w3-col l3">
            <img src="img/logo-rgb-magenta.png" height="20px"/><br/><br/>
            <ul>
                <li>Gent - Belgium</li>
                <li><phone>+32 468 238 754</phone></li>
                <li>0545 798 214</li>
            </ul>
        </address>
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
                <em class="w3-text-red w3-small" ng-if="error">E-mail of fout wachtwoord!</em>
            <form>
            </div>
        </div>
        <div class="modal-footer">
           <!-- 
           <em class="w3-small">Als u nog niet geregistreerd bent, klik dan <a href="" ng-click="registerClient()"><b>hier</b>.</a></em>
           -->
        </div>
    </script>        
    
</body>
</html>
