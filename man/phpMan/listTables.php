<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$table = $_GET['table'];
$data = array();

$result = mysql_query("SELECT * FROM ".$table);

if($result){
    while ($row = mysql_fetch_array($result)) {
        array_push($data, $row);
    }
}
echo json_encode($data);
