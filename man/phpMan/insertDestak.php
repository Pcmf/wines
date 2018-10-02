<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$destak = json_decode($dt->data);

echo $destak->wid.'  '.$destak->dobs;
$result = mysql_query(sprintf("INSERT INTO destak(wid,obs,dobsBE) VALUES(%s,'%s','%s')",
        $destak->wid,$destak->dobs,$destak->dobsBE));

if($result){
    echo 'Artigo destacado';
}