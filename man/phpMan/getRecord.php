<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$table = $_GET['table'];
$id = $_GET['id'];
$lang = $_GET['lang'];

$result = mysql_query(sprintf("SELECT * FROM ".$table." WHERE id = %s AND lang = %s",$id,$lang));

if($result){
    $row = mysql_fetch_array($result);
    echo json_encode($row);    
}

