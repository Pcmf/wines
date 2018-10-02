/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var winesApp = angular.module('winesApp',['ngRoute','ui.bootstrap']);

winesApp.config(['$routeProvider',
    function($routeProvider){
        $routeProvider
                .when('/inicio/',{templateUrl:'views/main_pt.html',controller:'iniController'})
                .when('/huis/',{templateUrl:'views/main_be.html',controller:'iniController'})
                .when('/produtos/:winetype',{templateUrl:'views/products_pt.php',controller:'productsController'})
                .when('/producten/:winetype',{templateUrl:'views/products_be.php',controller:'productsController'})
                .when('/outrosProdutos/:produto',{templateUrl:'views/outrosProdutos.php',controller:'otherProductsController'})
                .when('/otherProducten/:produto',{templateUrl:'views/otherProducten.php',controller:'otherProductsController'})
                .when('/shopCart/',{templateUrl:'views/shopCart.html',controller:'shopCartController'})
                .when('/shopCart_be/',{templateUrl:'views/shopCart_be.html',controller:'shopCartController'})
                .otherwise({redirectTo:'/huis'});
    }
]);

//start page controller
winesApp.controller('iniController',['$scope','$http','$location',
    function($scope,$http,$location){
//        if(sessionStorage.addvise === undefined){
//            alert("Para visitar este site tem que ter 18 anos ou mais!");
//            sessionStorage.addvise = "Check";
//        }
//        
        if($location.absUrl().includes('index_pt')) 
           {
                window.location.assign('#/inicio/');
        }   
        //testa o shopCart
        if(sessionStorage.orderList === undefined){
            sessionStorage.orderList = "";
            $scope.$parent.faColor = "black";
        }
        if(sessionStorage.orderList !== ''){
             $scope.$parent.faColor = "red";
        }
        
//Destaks
        $http({
            url:'php/getDestaks.php'
        }).success(function(answer){
            $scope.destaks = answer;
        });
    
//Call me
        $scope.saveContact = function(c){
            
            $http({
                url:'php/saveContact.php',
               method:'POST',
                data:{data: JSON.stringify(c)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answer){
                if(answer ==='1'){
                    alert("Sucesso! Em breve entraremos em contacto consigo!");
                    $scope.c ='';
                } else{
                    alert('Erro');
                }
                
            });

        };
//Send mensage
        $scope.sendMsg = function(m){
            $http({
                url:'php/saveMsg.php',
               method:'POST',
                data:{data: JSON.stringify(m)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answer){
                if(answer ==='1'){
                    alert("Sucesso! Em breve entraremos em contacto consigo!");
                    $scope.m ='';
                } else{
                    alert('Erro');
                }
            });
        };
    }

]);        



//products page controller
winesApp.controller('productsController',['$scope','$http','$modal','$routeParams',
    function($scope,$http,$modal,$routeParams){
        $http({
           url:'man/phpMan/getWines.php'
        }).success(function(answ){
//            alert(answ);
            $scope.catalog = answ;
        });
        $scope.searchCatalog = $routeParams.winetype;
    
    //function to open modal with the wine detail
        $scope.showWineDetail = function(w){
            var modalInstance = $modal.open({
                templateUrl:'modalWineDetail.html',
                controller:'modalInstanceWineDetail',
                size:'md',
                resolve:{
                    items:function(){
                        return w;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
            });               
        };  
        
    }
]);
//Instance for wine detail and add to chop cart
winesApp.controller('modalInstanceWineDetail',function ($scope,$modal,$modalInstance,$http,items){
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //show product detail
    $scope.wine = items;
    //add to chop cart - localStorage
    $scope.addToShopCar = function(wine,orderQtyC){
        $scope.$parent.faColor = "red";

        var orderList = [];
//        var order = '{"owid":"'+wine.id+'","owname":"'+wine.name+'","owqty":"'+orderQtyC+'"}';
        var order = {};
        order.owid = wine.id;
        order.owname = wine.name;
        order.owqty = orderQtyC;
        order.owpricesell = wine.pricesell;
        order.owpackage = wine.pkname;
        
        if(sessionStorage.orderList !==''){
            orderList = JSON.parse(sessionStorage.orderList);
            orderList.push(order);
        } else {
            orderList.push(order);
        }
        sessionStorage.orderList = JSON.stringify(orderList);
        $modalInstance.dismiss('cancel');
    };
    
});

//Other Products page controller
winesApp.controller('otherProductsController',['$scope','$http','$modal','$routeParams',
    function($scope,$http,$modal,$routeParams){
        $http({
           url:'man/phpMan/getProducts.php'
        }).success(function(answ){
//            alert(answ);
            $scope.catalog = answ;
        });
        
        $scope.searchCatalog = $routeParams.produto;
    
    //function to open modal with the product detail
        $scope.showDetail = function(w){
            var modalInstance = $modal.open({
                templateUrl:'modalProductDetail.html',
                controller:'modalInstanceProductDetail',
                size:'md',
                resolve:{
                    items:function(){
                        return w;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
            });               
        };  
        
    }
]);
//Instance for product detail and add to chop cart
winesApp.controller('modalInstanceProductDetail',function ($scope,$modal,$modalInstance,$http,items){
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //show product detail
    $scope.product = items;
    //add to chop cart - localStorage
    $scope.addToShopCar = function(product,orderQtyC){
        $scope.$parent.faColor = "red";

        var orderList = [];
        var order = {};
        order.owid = product.id;
        order.owname = product.name;
        order.owqty = orderQtyC;
        order.owpricesell = product.pricesell;
        order.owpackage = product.pkname;
        
        if(sessionStorage.orderList !==''){
            orderList = JSON.parse(sessionStorage.orderList);
            orderList.push(order);
        } else {
            orderList.push(order);
        }
        sessionStorage.orderList = JSON.stringify(orderList);
        $modalInstance.dismiss('cancel');
    };
    
});


//Controler do login que chama o modal de login
winesApp.controller('loginController',['$scope','$modal','$rootScope',
    function($scope,$modal,$rootScope){
            $scope.logName = "";
        //open login modal
        $scope.showLoginModal = function(){
            var modalInstance = $modal.open({
                templateUrl:'modalLogin.html',
                controller:'modalInstanceLogin',
                size:'l'
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
              $scope.logName = selectedItem.name;
              $rootScope.logName = selectedItem.name;
              $rootScope.u = selectedItem;
            });               
        };    
    }]);

//Instance for LOGIN
winesApp.controller('modalInstanceLogin',function ($scope,$modal,$modalInstance,$http){
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Close modal and redirect to register page
    $scope.registerClient = function(){
        $modalInstance.dismiss('cancel');
        window.location.assign('#/registar/');

    };
    //Check login
    $scope.login = function(u){
        $scope.error = 0; 
        if(u.emailLogin == 'p@c.m' && u.passLogin == '123'){
            $modalInstance.close();
//                abrir a pagina para manutenção em cima da propria
            window.location.replace('man/man.php');            
        } else {
            $scope.error = 1;  
        }      
         
    };
});


//Shpping Cart - folha de encomenda
winesApp.controller('shopCartController',['$scope','$http',
    function($scope,$http){
        //testa o shopCart
        var shopCart ={};
        if(sessionStorage.orderList !== ""){
            shopCart  = JSON.parse(sessionStorage.orderList);
            $scope.shopCart = shopCart;
//            var total = 0.00;
//            $scope.shopCart.forEach(function(line){
//                total += line.owqty * line.owpricesell;
//            });
            $scope.total = upTotal();
        }
        
        //Remove one line from shopCart
        $scope.removeLineShopCart = function(line){
            var p = $scope.shopCart.indexOf(line);
            $scope.shopCart.splice(p,1);
            $scope.total = upTotal();
            sessionStorage.removeItem("orderList");
            sessionStorage.orderList = JSON.stringify($scope.shopCart);
            
        };
        
        //Save Order
        $scope.sendOrder = function(order){
          //Guardar na BD os dados da encomenda
          order.orderList = $scope.shopCart;
          
          
          $http({
               url:'php/saveOrder.php',
               method:'POST',
                data:{data: JSON.stringify(order)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
                alert(answ);
                sessionStorage.removeItem("orderList");
                window.location.assign('#/inicio/'); 
            }); 
        };
        
        //update Total 
        function upTotal(){
            var total = 0.00;
            $scope.shopCart.forEach(function(line){
                total += line.owqty * line.owpricesell;
            });
            return total;
        }
    }
]);
