<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<h1 class="text-center">Catálogo</h1>
<div class="container text-center">
    <input type="text" ng-model="searchCatalog" placeholder="pesquisa no catalogo"/>
    <span class="glyphicon glyphicon-search"></span>
</div>
<br/><br/>
<div class="container text-center">
    <div class="row row-fluid">
        <div class="col-lg-3 col-md-6 col-sm-12" ng-repeat="product in catalog | filter: searchCatalog">
            <div class="productPanel" ng-click="showWineDetail(product)">
                <img ng-src="IMG/{{product.photobottle}}" class="catalogPhoto" alt="{{product.name}}"/>
                <br/>
                <h5>{{product.name}}</h5>
                <!--<h6>{{product.wtname}}</h6>-->
                <h6>{{product.rname}}</h6>
            </div>
            
        </div>
    </div>
</div>


   <!--  Wine  Detail Modal-->
    <script type="text/ng-template" id="modalWineDetail.html">
        <div class="modal-header">
            <h3 class="modal-title text-center">
                {{wine.name}} <span ng-if="wine.subtitle"> - {{wine.subtitle}}</span>
                <span class="closeModal" ng-click="closeModal()">X</span>
            </h3>
        </div>
        <div class="modal-body row">
                <div class="wineDetailPhotoDiv">
                    <img class="wineDetailPhoto" ng-src="IMG/{{wine.photobottle}}" alt="{{wine.name}}"/>
                </div>
                <div class="wineDetailText">
                    <label>Ano: </label>
                    <span>{{wine.year}}</span>
                    <br/>
                    <label>Pais: </label>
                    <span> Portugal</span>
                    <br/>
                    <label>Região: </label>
                    <span> {{wine.rname}}</span>
                    <br/>
                    <label>Castas: </label>
                    <span> {{wine.grapescoll}}</span>
                    <br/>
                    <label>Solo: </label>
                    <span> {{wine.sname}}</span>
                    <br/>                    
                    <label>Nota de prova: </label>
                    <span> {{wine.tasting}}</span>
                    <br/>                    
                    <label>Teor Alcoólico: </label>
                    <span> {{wine.alcohol}} % vol</span>
                    <br/>
                    <label>Serviço: </label>
                    <span> {{wine.service}}</span>
                    <br/>
                    <label>Enologo: </label>
                    <span> {{wine.oname}}</span>
                    <br/>
                    <label>Produtor: </label>
                    <span> {{wine.pname}}</span>
                    <br/>                    
                </div>
        </div>
        <div class="modal-footer">
            <form>
                
                <em>Preço: {{wine.pricesell}} €</em>
                <br/>
                <em>Embalagem : {{wine.pkname}}</em>
                <br/><br/>
               <input class="inputShort" type="number" min="1" ng-model="orderQty"/> 
               <button class="buttonModal w3-red" ng-click="addToShopCar(wine,orderQty)">Adicionar
                <span class="fa fa-shopping-cart w3-red"></span>
               </button>
            </form>
        </div>

        
    </script>    
