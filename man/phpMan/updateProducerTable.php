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
    $result = mysql_query(sprintf("UPDATE producer SET name = '%s', address = '%s',country='%s',"
            . "phone='%s',mobile='%s',email='%s',site='%s' WHERE id = %s",
            $d->name,$d->address,$d->country,$d->phone,$d->mobile,$d->email,$d->site,$d->id));
    
    if($result){
        echo 'Atualizado ';
        return;
    }
} else {
    $result = mysql_query(sprintf("INSERT INTO producer(name,address,country,phone,mobile,email,site)"
            . " VALUES('%s','%s','%s','%s','%s','%s','%s')",
             $d->name,$d->address,$d->country,$d->phone,$d->mobile,$d->email,$d->site));
   if($result){
        $data = array();

        $result = mysql_query("SELECT * FROM producer");

        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
   }
}    
            
