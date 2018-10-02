<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$wid = $_GET['wid'];

$result = mysql_query(sprintf("DELETE FROM destak WHERE wid = %s",$wid));

if($result){
    echo 'Removido de destak';
}