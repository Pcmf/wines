<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<h1 class="text-center">Azeite, Aguardente, Brandy de Portugal</h1>
<div class="container text-center">
    <input type="text" ng-model="searchCatalog" placeholder="procurar"/>
    <span class="glyphicon glyphicon-search"></span>
</div>
<br/><br/>
<div class="container text-center">
    <div class="row row-fluid">
        <div class="col-lg-3 col-md-6 col-sm-12" ng-repeat="product in catalog | filter: searchCatalog">
            <div class="productPanel" ng-click="showDetail(product)">
                <img ng-src="img/{{product.image}}" class="catalogPhoto" alt="{{product.name}}"/>
                <h5 class="w3-text-teal">{{product.name}}</h5>
                <h6 class="w3-tiny">{{product.type}}</h6>
                <!--<h6 class="w3-small">{{product.description_be}}</h6>-->
                <span class="w3-tiny">{{product.pricesell}} €</span>
            </div>
            
        </div>
    </div>
</div>


      <!--  product  Detail Modal-->
    <script type="text/ng-template" id="modalProductDetail.html">
        <div class="modal-header">
            <h3 class="modal-title text-center">
                {{product.name}} <span ng-if="product.subtitle"> - {{product.subtitle}}</span>
                <span class="closeModal" ng-click="closeModal()">X</span>
            </h3>
        </div>
        <div class="modal-body row">
                <div class="wineDetailPhotoDiv">
                    <img class="wineDetailPhoto" ng-src="img/{{product.image}}" alt="{{product.name}}"/>
                </div>
                <div class="wineDetailText">
                    
                    <label>Descrição: </label>
                    <span> {{product.description}}</span>
                    <br/>                    

                    <label>Embalagem: </label>
                    <span>{{product.pkname}}</span>
                    <br/>    
                </div>
        </div>
        <div class="modal-footer">
            <form>
                
                <em>Prijs: {{product.pricesell}} €</em>

                <br/><br/>
               <input class="inputShort" type="number" min="1" ng-model="orderQty"/> 
               <button class="buttonModal w3-red" ng-click="addToShopCar(product,orderQty)">Add
                <span class="fa fa-shopping-cart w3-red"></span>
               </button>
            </form>
        </div>

        
    </script>    
