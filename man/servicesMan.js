/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

winesMan.service('tableServices',['$http',
    function($http){
        var data = function(t,calbackFn){
            $http({
               url:'phpMan/listTables.php',
               method:'GET',
               params:{table:t}
            }).success(function(data){
                    calbackFn(data);
            }); 
        };
        return {listTables : data};
    }
]);
