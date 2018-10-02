<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$d = json_decode($dt->data);

$result = mysql_query(sprintf("UPDATE wineorder SET status = '%s', statusdate = NOW()"
        . " WHERE id = %s",$d->newStatus, $d->id));

if($result){
    echo 'Atualizado ';
    return;
} else {
    echo 'Erro';
}