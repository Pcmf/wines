<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';


$answer = array();

$result = mysql_query(sprintf("SELECT P.*, PT.type, PT.type_be,PT.type_fr, PT.type_en, PK.name AS pkname"
        . " FROM product P, producttype PT, packing PK "
        . " WHERE P.type = PT.id AND P.packing = PK.id "
        . " ORDER BY P.name, pricesell DESC"));

if($result){
    while ($row = mysql_fetch_array($result)) {
      array_push($answer, $row);
    }
    echo json_encode($answer);
}