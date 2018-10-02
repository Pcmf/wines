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
    $result = mysql_query(sprintf("UPDATE packing SET name = '%s' WHERE id = %s",
            $d->name,$d->id));
    
    if($result){
        echo 'Atualizado';
        return;
    }
} else {
    $result = mysql_query(sprintf("INSERT INTO packing(name) VALUES('%s')",
            $d->name));
   if($result){
        $data = array();

        $result = mysql_query("SELECT * FROM packing");

        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
   }
}    
            
