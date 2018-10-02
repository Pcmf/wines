<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$wid = $_GET['wine'];

//$result = mysql_query(sprintf("DELETE FROM wine WHERE id = %s",$wid));

$result = mysql_query(sprintf("UPDATE wine SET active = NOT(active) WHERE id = %s",$wid));

if($result){
    echo 'Alterado';
}