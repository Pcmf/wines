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
  <title>Vinho Português</title>
  <link rel="shortcut icon" href="favicon.ico">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Vinhos de Portugal aos melhores preços">
  <meta name="keywords" content="vinho do douro, vinho do porto, aguardente, bagaceira, licor beirão,
        azeite, azeite de portugal,wijn, wijnen, wijn uit Portugal,wijnen uit Portugal, portuguese wijnen,
        wijngaarden van de valleien van de Douro, douro wijn, alentejo wijn, vinho verde, portuguese wijnen in belgium,
        wijn aan de beste prijs,Afhankelijk van de beschikbaarheid, maar steeds volgens afspraak, 
        vinho de portugal, vinho portugues, vinho do douro, vinho verde, vinhos portugueses, vinhos
         de portugal, vinho alentejo">
  <meta name="author" content="Pedro Mendes Ferreira">
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-96247722-1', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body ng-app="winesApp">
   <!--Facebook code--> 
 <script type="text/javascript">
(function() {
	var e = document.createElement('script');
	e.src = document.location.protocol + '//connect.facebook.net/pt_BR/all.js';
	e.async = true;
	document.getElementById('fb-root').appendChild(e);
}());
 
window.fbAsyncInit = function () {
	FB.init({
		appId  : '128956594371251',
		status : true, // check login status
		cookie : true, // enable cookies to allow the server to access the session
		xfbml  : true,  // parse XFBML
		oauth  : true // enable OAuth 2.0
	});
};
</script>
<!--<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=128956594371251";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>-->

<nav class="navbar">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar bnt-black"></span>
        <span class="icon-bar bnt-black"></span>                        
        <span class="icon-bar bnt-black"></span>                        
      </button>
        <a href="#/inicio">
            <img src="galery/logo2.1.fw.png" class="logoFB"/>
        </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <h1 class="w3-center h1Header">Vinhos Portugueses</h1> 
      <ul class="nav navbar-nav">
          <li><a href="#/inicio"><i class="fa fa-home"> Inicio</i></a></li>
          <li><a href="#/produtos/%20"><i class="fa fa-th-list"> Vinhos</i></a></li>
          <li><a href="#/outrosProdutos/%20"><i class="fa fa-th-list">Outros Produtos</i></a></li>
          <li><a href="#/shopCart/"><i class="fa fa-shopping-cart" style="color:{{faColor}};"> Shopcart</i></a></li>
          <li><a href="#/comments/"><i class="fa fa-comment" aria-hidden="true"> Comentários</i></a></li>
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
    <div ng-view=""></div>
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
                <p>FB Reprentações - Penafiel / Gent</p>
<div class="fb-like" data-href="http://wijn-fb.be" data-layout="button" data-action="like"
     data-size="small" data-show-faces="true" data-share="true"></div>              
        </div>
        <address class="w3-col l3">
            <img src="img/logo-rgb-magenta.png" height="20px"/><br/><br/>
            <ul>
            <ul>
                <li>Gent - Belgium</li>
                <li><+32 468 238 754</li>
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
