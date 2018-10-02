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
    $result = mysql_query(sprintf("UPDATE soil SET name = '%s', characteristics = '%s',"
            . "name_en = '%s', charact_en='%s',name_fr = '%s', charact_fr='%s',name_be = '%s', charact_be='%s'"
            . " WHERE id = %s",
            $d->name,$d->characteristics,$d->name_en,$d->charact_en,$d->name_fr,
            $d->charact_fr,$d->name_be,$d->charact_be,$d->id));
    
    if($result){
        echo 'Atualizado ';
        return;
    }
} else {
    $result = mysql_query(sprintf("INSERT INTO soil(name,characteristics,name_en,charact_en,"
            . "name_fr,charact_fr,name_be,charact_be) VALUES('%s','%s','%s','%s','%s','%s','%s','%s')",
            $d->name,$d->characteristics,$d->name_en,$d->charact_en,$d->name_fr,
            $d->charact_fr,$d->name_be,$d->charact_be));
   if($result){
        $data = array();

        $result = mysql_query("SELECT * FROM soil");

        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
   }
}    
            
