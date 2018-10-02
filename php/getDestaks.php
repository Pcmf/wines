<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../man/phpMan/openCon.php';

$answer = array();

$result = mysql_query(sprintf("SELECT D.obs AS obstext,D.dobsBE, W.*, R.name AS rname,"
        . " WT.name AS wtname, WT.name_be AS wtname_be  "
        . "FROM destak D, wine W, region R, winetype WT"
        . " WHERE D.wid = W.id AND W.region = R.id AND W.winetype = WT.id"));
if($result){
    while ($row = mysql_fetch_array($result)) {
        array_push($answer, $row);
    }
    echo json_encode($answer);
}