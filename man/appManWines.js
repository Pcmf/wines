/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var winesMan = angular.module('winesMan',['ngRoute','winesApp','angularFileUpload']);


winesMan.config(['$routeProvider',
    function($routeProvider){
        $routeProvider
                .when('/list/',{templateUrl:'viewsMan/listCatolog.html',controller:'listagemController'})
                .when('/others/',{templateUrl:'viewsMan/listOthers.html',controller:'othersController'})
                .when('/contacts/',{templateUrl:'viewsMan/contacts.html',controller:'contactsController'})
                .when('/orders/',{templateUrl:'viewsMan/orders.html',controller:'ordersController'})
                .when('/region/',{templateUrl:'viewsMan/region.html',controller:'regionController'})
                .when('/locality/',{templateUrl:'viewsMan/locality.html',controller:'localityController'})
                .when('/producer/',{templateUrl:'viewsMan/producer.html',controller:'producerController'})
                .when('/soil/',{templateUrl:'viewsMan/soil.html',controller:'soilController'})
                .when('/winetype/',{templateUrl:'viewsMan/winetype.html',controller:'winetypeController'})
                .when('/producttype/',{templateUrl:'viewsMan/producttype.html',controller:'producttypeController'})
                .when('/oenologist/',{templateUrl:'viewsMan/oenologist.html',controller:'oenologistController'})
                .when('/grape/',{templateUrl:'viewsMan/grape.html',controller:'grapeController'})
                .when('/packing/',{templateUrl:'viewsMan/packing.html',controller:'packingController'})
                .otherwise({redirectTo:'/list'});
    }
]);
//LOGOUT
winesMan.controller('logOutCtrl',['$scope',
    function($scope){
        $scope.logOut = function(){
            window.location.assign('../index.php');
        };
    }
]);

//Listagem do catalogo
winesMan.controller('listagemController',['$scope','$http','$modal','$rootScope','$upload',
    function($scope,$http,$modal,$rootScope,$upload){
        
        listCatolog();
        function listCatolog(){
        $http({
           url:'phpMan/getWines.php'
        }).success(function(answ){
//            alert(answ);
            $scope.wines = answ;

        });
        }
        //Open Wine Modal
        $scope.editWine = function(r){
            var modalInstance = $modal.open({
                templateUrl:'wineModal.html',
                controller:'modalInstanceWine',
                size:'lg',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new Wine
        $scope.addNewWine = function(r){
            //Open Wine Modal
                var modalInstance = $modal.open({
                    templateUrl:'wineModal.html',
                    controller:'modalInstanceWine',
                    size:'lg',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };
        
        //Add or remove from destak
        $scope.editDestak = function(w){
          //Remove from destak
            if(w.destak.wid !==0){
                var confirm = window.confirm("Pretende remover de destak?");
                if(confirm){
                    $http({
                            url:'phpMan/removeDestak.php',
                            method:'GET',
                            params:{wid:w.destak.wid}
                        }).success(function(data){
                          listCatolog();

                    });
                }
            } else {
                //destacar artigo
                w.destak['dobs'] = window.prompt("Texto para o destaque PT: ",'uma pequena descrição');
                w.destak['dobsBE'] = window.prompt("Tekst het hoogtepunt BE: ",'een korte beschrijving');
                w.destak['wid'] = w.id;
    //            alert(w.destak.dobs);
                $http({
                   url:'phpMan/insertDestak.php',
                   method:'POST',
                    data:{data:JSON.stringify(w.destak)},
                    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
                }).success(function(answ){
    //                alert(answ);
                });             
        }
        };
        //Delete Wine
        $scope.deleteWine = function(wine){
            if(wine.active && wine.destak.wid !==0){
                alert("É necessário remover do destaque antes de apagar!");
            } else {
                if(wine.active == 1){
                   var confirma = window.confirm("ATENÇÃO!! \nPretende mesmo DESATIVAR este vinho?"); 
                } else {
                   confirma = window.confirm("ATENÇÃO!! \nPretende mesmo ACTIVAR este vinho?");  
                }

                if(confirma){
                $http({
                    url:'phpMan/deleteWine.php',
                    method:'GET',
                    params:{wine:wine.id}
                }).success(function(answer){
                  //  alert(answer);
                    listCatolog();                    
                });
                }
            }
        };
        
    }
]);
//ModalInstance for Wine Edit Modal
winesMan.controller('modalInstanceWine',['$scope','$modalInstance','$http','items','tableServices','$upload',
function ($scope,$modalInstance,$http,items,tableServices,$upload){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Get all the wine types, regions, producers, ...
        tableServices.listTables('winetype',function(data){
            $scope.wtypes = data;
            tableServices.listTables('region',function(data){
                $scope.regions = data;
                tableServices.listTables('producer',function(data){
                    $scope.producers = data;
                    tableServices.listTables('locality',function(data){
                        $scope.localities = data;
                          tableServices.listTables('soil',function(data){
                            $scope.soils = data;
                            tableServices.listTables('grape',function(data){
                                $scope.grapes = data;
                                tableServices.listTables('oenologist',function(data){
                                    $scope.oenologs = data;
                                    tableServices.listTables('packing',function(data){
                                        $scope.packs = data;
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
        
    $scope.saveEdit = function(u){
        var error= 0;
        if(u.winetype === undefined){
            error = 1;
            alert('Tem de selecionar o tipo de vinho!');
            document.getElementById('wt').focus();
        }
        if(u.region === undefined && !error){
            error = 1;
            alert("Tem de selecionar uma região!");
            document.getElementById('wr').focus();
        }
        if(u.producer === undefined && !error){
            error = 1;
            alert("Tem de selecionar um produtor!");
            document.getElementById('wp').focus();
        }

        if(u.oenologist === undefined && !error){
            error = 1;
            alert("Tem de selecionar um Enologo!");
            document.getElementById('wo').focus();
        }
        if(u.packing === undefined && !error){
            error = 1;
            alert("Tem de selecionar o tipo de embalagem!");
            document.getElementById('wpk').focus();
        }        
        if(!error){
            $http({
               url:'phpMan/updateWineTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
                alert(answ);
                $modalInstance.close(answ);

            }); 
        }
    };
    //Selction of Grapes
    $scope.grapesCollUpdate = function(){
        $scope.r.grapescoll ="";
        $scope.grapesColl.forEach(function(g){
            $scope.r.grapescoll +=g+';';            
        });

    };
        //carregar imagens
    $scope.onFileSelect2 = function($files) {
        //$files: an array of files selected, each file has name, size, and type.
        for (var i = 0; i < $files.length; i++) {
            var $file = $files[i];
            $upload.upload({
                url: 'phpMan/upload-image.php', 
                headers: {'Content-Type': $file.type},
                method: 'POST',
                data: $file,
                file: $file
            }).success(function(resposta){
//                alert(resposta);
                $scope.r.photobottle = resposta;
            }); 
        }
    };      

}]);


//Listagem do catalogo de Outros Produtos
winesMan.controller('othersController',['$scope','$http','$modal','$rootScope','$upload',
    function($scope,$http,$modal,$rootScope,$upload){
        
        listOthersCatolog();
        
        function listOthersCatolog(){
        $http({
           url:'phpMan/getProducts.php'
        }).success(function(answ){
//            alert(answ);
            $scope.products = answ;

        });
        }
        //Open Product Modal
        $scope.editProduct = function(r){
            var modalInstance = $modal.open({
                templateUrl:'productModal.html',
                controller:'modalInstanceProduct',
                size:'lg',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new Product
        $scope.addNewProduct = function(r){
            //Open Wine Modal
                var modalInstance = $modal.open({
                    templateUrl:'productModal.html',
                    controller:'modalInstanceProduct',
                    size:'lg',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };
        
        //Add or remove from destak
//        $scope.editDestak = function(w){
//          //Remove from destak
//            if(w.destak.wid !==0){
//                var confirm = window.confirm("Pretende remover de destak?");
//                if(confirm){
//                    $http({
//                            url:'phpMan/removeDestak.php',
//                            method:'GET',
//                            params:{wid:w.destak.wid}
//                        }).success(function(data){
//                          listCatolog();
//
//                    });
//                }
//            } else {
//                //destacar artigo
//                w.destak['dobs'] = window.prompt("Texto para o destaque PT: ",'uma pequena descrição');
//                w.destak['dobsBE'] = window.prompt("Tekst het hoogtepunt BE: ",'een korte beschrijving');
//                w.destak['wid'] = w.id;
//    //            alert(w.destak.dobs);
//                $http({
//                   url:'phpMan/insertDestak.php',
//                   method:'POST',
//                    data:{data:JSON.stringify(w.destak)},
//                    headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
//                }).success(function(answ){
//    //                alert(answ);
//                });             
//        }
//        };
        //Delete Product
        $scope.deleteProduct = function(product){

                if(window.confirm("ATENÇÃO!! \nPretende mesmo remover este produto da lista?")){
                $http({
                    url:'phpMan/deleteProduct.php',
                    method:'GET',
                    params:{product:product.id}
                }).success(function(answer){
                    alert(answer);
                    listOthersCatolog();                    
                });
                }
        };
    }
]);
//ModalInstance for Product Edit Modal
winesMan.controller('modalInstanceProduct',['$scope','$modalInstance','$http','items','tableServices','$upload',
function ($scope,$modalInstance,$http,items,tableServices,$upload){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Get all the product types, regions, producers, ...
    tableServices.listTables('producttype',function(data){
        $scope.ptypes = data;
        tableServices.listTables('packing',function(data){
            $scope.packs = data;
        });
    });
        
    $scope.saveEdit = function(u){
        var error= 0;

        if(u.packing === undefined && !error){
            error = 1;
            alert("Tem de selecionar o tipo de embalagem!");
            document.getElementById('wpk').focus();
        }        
        if(!error){
            $http({
               url:'phpMan/updateProductTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
                alert(answ);
                $modalInstance.close(answ);

            }); 
        }
    };
    //Selction of Grapes
    $scope.grapesCollUpdate = function(){
        $scope.r.grapescoll ="";
        $scope.grapesColl.forEach(function(g){
            $scope.r.grapescoll +=g+';';            
        });

    };
        //carregar imagens
    $scope.onFileSelect2 = function($files) {
        //$files: an array of files selected, each file has name, size, and type.
        for (var i = 0; i < $files.length; i++) {
            var $file = $files[i];
            $upload.upload({
                url: 'phpMan/upload-image.php', 
                headers: {'Content-Type': $file.type},
                method: 'POST',
                data: $file,
                file: $file
            }).success(function(resposta){
//                alert(resposta);
                $scope.r.image = resposta;
            }); 
        }
    };      

}]);


//Regioes
winesMan.controller('regionController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        //List regions
        tableServices.listTables('region',function(data){
            $scope.data = data;
        });
        
        //Open regionModal
        $scope.showModalRegion = function(r){
            var modalInstance = $modal.open({
                templateUrl:'regionModal.html',
                controller:'modalInstanceRegion',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new region
        $scope.addNewRegion = function(r){
            //Open regionModal
                var modalInstance = $modal.open({
                    templateUrl:'regionModal.html',
                    controller:'modalInstanceRegion',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };
    }
]);
//ModalInstance for Region Edit Modal
winesMan.controller('modalInstanceRegion',function ($scope,$modalInstance,$http,items,tableServices){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Get all the languages and flags
        tableServices.listTables('language',function(data){
            $scope.flags = data;
        });    
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateRegionTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
             //   alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});

//Packing
winesMan.controller('packingController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('packing',function(data){
            $scope.data = data;
        });
        //Open packingModal
        $scope.showModalPacking = function(r){
            var modalInstance = $modal.open({
                templateUrl:'packingModal.html',
                controller:'modalInstancePacking',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new Packing type
        $scope.addNewPacking = function(r){
            //Open regionModal
                var modalInstance = $modal.open({
                    templateUrl:'packingModal.html',
                    controller:'modalInstancePacking',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };        
    }
]);
//Instance for Packing edit modal
winesMan.controller('modalInstancePacking',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updatePackingTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});


//Locality
winesMan.controller('localityController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('locality',function(data){
            $scope.data = data;
        });
                //Open LocalityModal
        $scope.showModalLocality= function(r){
            var modalInstance = $modal.open({
                templateUrl:'localityModal.html',
                controller:'modalInstanceLocality',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new Locality type
        $scope.addNewLocality = function(r){
            //Open regionModal
                var modalInstance = $modal.open({
                    templateUrl:'localityModal.html',
                    controller:'modalInstanceLocality',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for Locality edit modal
winesMan.controller('modalInstanceLocality',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateLocalityTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});

//Producer
winesMan.controller('producerController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('producer',function(data){
            $scope.data = data;
        });  
                //Open Producer Modal
        $scope.showModalProducer= function(r){
            var modalInstance = $modal.open({
                templateUrl:'producerModal.html',
                controller:'modalInstanceProducer',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
            });               
        };   
        //Add new Producer
        $scope.addNewProducer = function(r){
            //Open Producer Modal
                var modalInstance = $modal.open({
                templateUrl:'producerModal.html',
                controller:'modalInstanceProducer',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for Producer edit modal
winesMan.controller('modalInstanceProducer',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateProducerTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});

//Wine Type
winesMan.controller('winetypeController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
       
        tableServices.listTables('winetype',function(data){
            $scope.data = data;
//            alert(data);
        });  
                //Open WineType Modal
        $scope.showModalWineType= function(r){
            var modalInstance = $modal.open({
                templateUrl:'wineTypeModal.html',
                controller:'modalInstanceWineType',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
              $rootScope.r = selectedItem;
            });               
        };   
        //Add new  Wine Type
        $scope.addNewWineType = function(r){

                var modalInstance = $modal.open({
                templateUrl:'wineTypeModal.html',
                controller:'modalInstanceWineType',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for  Wine Type edit modal
winesMan.controller('modalInstanceWineType',function ($scope,$modalInstance,$http,items,tableServices){
    $scope.r = items;
    
    tableServices.listTables('language',function(data){
        $scope.flags = data;
    });  
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Load Language 
    $scope.loadLanguage = function(id,lang){
        var t = 'winetype';
        $http({
           url:'phpMan/getRecord.php',
           method:'GET',
           params:{table:t,id:id,lang:lang}
        }).success(function(data){
                if(data !== 'false'){
                    $scope.r = data;
                } else {
                    $scope.r.lang = lang;
                    $scope.r.characteristics = '';
                }
        });
    };
    
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateWineTypeTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
            }); 
    };

});

//Oenologist
winesMan.controller('oenologistController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('oenologist',function(data){
            $scope.data = data;
        });  
                //Open Oenologist Modal
        $scope.showModalOenologist= function(r){
            var modalInstance = $modal.open({
                templateUrl:'oenologistModal.html',
                controller:'modalInstanceOenologist',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
              $rootScope.r = selectedItem;
            });               
        };   
        //Add new  Oenologist
        $scope.addNewOenologist = function(r){
            //Open Oenologist Modal
                var modalInstance = $modal.open({
                templateUrl:'oenologistModal.html',
                controller:'modalInstanceOenologist',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for  Oenologist edit modal
winesMan.controller('modalInstanceOenologist',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateOenologistTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});

//Soil
winesMan.controller('soilController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('soil',function(data){
            $scope.data = data;
        });  
                //Open Soil  Modal
        $scope.showModalSoil= function(r){
            var modalInstance = $modal.open({
                templateUrl:'soilModal.html',
                controller:'modalInstanceSoil',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
              $rootScope.r = selectedItem;
            });               
        };   
        //Add new Locality type
        $scope.addNewSoil = function(r){
            //Open regionModal
                var modalInstance = $modal.open({
                    templateUrl:'soilModal.html',
                    controller:'modalInstanceSoil',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for Soil edit modal
winesMan.controller('modalInstanceSoil',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateSoilTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});
//Grape
winesMan.controller('grapeController',['$scope','tableServices','$modal','$rootScope',
    function($scope,tableServices,$modal,$rootScope){
        tableServices.listTables('grape',function(data){
            $scope.data = data;
        });  
                //Open Grape  Modal
        $scope.showModalGrape= function(r){
            var modalInstance = $modal.open({
                templateUrl:'grapeModal.html',
                controller:'modalInstanceGrape',
                size:'l',
                resolve:{
                    items:function(){
                        return r;
                    }
                }
            });
            //data return from modalInstance
            modalInstance.result.then(function (selectedItem) {
              $rootScope.r = selectedItem;
            });               
        };   
        //Add new Grape type
        $scope.addNewGrape = function(r){
            //Open Grape
                var modalInstance = $modal.open({
                    templateUrl:'grapeModal.html',
                    controller:'modalInstanceGrape',
                    size:'l',
                    resolve:{
                        items:function(){
                            return r;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function (selectedItem) {
                  $scope.data = "";
                  $scope.data = selectedItem;
                });               
        };          
    }
]);
//Instance for Soil edit modal
winesMan.controller('modalInstanceGrape',function ($scope,$modalInstance,$http,items){
    $scope.r = items;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Save edition
    $scope.saveEdit = function(u){
            $http({
               url:'phpMan/updateGrapeTable.php',
               method:'POST',
                data:{data: JSON.stringify(u)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(answ){
//                alert(answ);
                $modalInstance.close(answ);
                
            }); 
         
    };

});

//Listagem dos contactos
winesMan.controller('contactsController',['$scope','$http','$modal','$rootScope','$upload',
    function($scope,$http,$modal,$rootScope,$upload){
        //listar conatacts
        getGontacts();

        
        function getGontacts(){
            $http({
               url:'phpMan/getContacts.php',
               method:'GET'
            }).success(function(data){
                 $scope.contacts = data;
            });
            
        }
    }
]);

//Listagem das Encomendas
winesMan.controller('ordersController',['$scope','$http','$modal','$rootScope','$upload',
    function($scope,$http,$modal,$rootScope,$upload){
        //listar conatacts
        getOrders();

        //Show order detail
        $scope.openOrderDetail = function(o){
            //Open Grape
                var modalInstance = $modal.open({
                    templateUrl:'orderModal.html',
                    controller:'modalInstanceOrder',
                    size:'l',
                    resolve:{
                        items:function(){
                            return o;
                        }
                    }
                });
                //data return from modalInstance
                modalInstance.result.then(function () {
                    getOrders();
                });               
        };      
        
        function getOrders(){
            $http({
               url:'phpMan/getOrders.php',
               method:'GET'
            }).success(function(data){
                alert(data);
                 $scope.orders = data;
            });
            
        }
    }
]);
//Instance for Order Detail modal
winesMan.controller('modalInstanceOrder',function ($scope,$modalInstance,$http,items){
    
    $scope.order = items;
    $scope.orderdetails = items.orderDetails;
    //Close modal
    $scope.closeModal = function(){
        $modalInstance.dismiss('cancel');
    };
    //Confirm order
    $scope.confOrder = function(order){
            $http({
               url:'phpMan/updateOrder.php',
               method:'POST',
                data:{data: JSON.stringify(order)},
                headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}
            }).success(function(){
//                alert(answ);
                $modalInstance.close();
            }); 
    };

});