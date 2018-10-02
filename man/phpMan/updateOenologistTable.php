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
    $result = mysql_query(sprintf("UPDATE oenologist SET name = '%s', obs = '%s',obs_en = '%s',"
            . "obs_fr = '%s', obs_be = '%s, site='%s' WHERE id = %s",
            $d->name,$d->obs,$d->obs_en,$d->obs_fr,$d->obs_be,$d->site,$d->id));
    
    if($result){
        echo 'Atualizado ';
        return;
    }
} else {
    $result = mysql_query(sprintf("INSERT INTO oenologist(name,obs,obs_en,obs_fr,obs_be,site)"
            . " VALUES('%s','%s','%s','%s','%s','%s')",
            $d->name,$d->obs,$d->obs_en,$d->obs_fr,$d->obs_be,$d->site));
   if($result){
        $data = array();

        $result = mysql_query("SELECT * FROM oenologist");

        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
   }
}    
            
