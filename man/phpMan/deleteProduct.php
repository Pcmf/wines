<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$pid = $_GET['product'];

$result = mysql_query(sprintf("DELETE FROM product WHERE id = %s",$pid));

if($result){
    echo 'Removido';
}