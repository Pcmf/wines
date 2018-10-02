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

if(isset($d->id) && $d->id != NULL){
    $result = mysql_query(sprintf("UPDATE grape SET name = '%s', characteristics = '%s'"
            . ",charact_en = '%s', charact_fr = '%s', charact_be = '%s' WHERE id = %s",
            $d->name,$d->characteristics,$d->charact_en,$d->charact_fr,$d->charact_be, $d->id));
    
    if($result){
        echo 'Atualizado ';
        return;
    }
} else {
    $result = mysql_query(sprintf("INSERT INTO grape(name,characteristics,charact_en,charact_fr,charact_be)"
            . " VALUES('%s','%s','%s','%s','%s')",
            $d->name,$d->characteristics,$d->charact_en,$d->charact_fr,$d->charact_be));
   if($result){
        $data = array();
        $result = mysql_query("SELECT * FROM grape");
        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
   }
}    
            
