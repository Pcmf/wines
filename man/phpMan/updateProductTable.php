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

if(!isset($d->subtitle)){
    $d->subtitle = NULL;
}
if(!isset($d->subtitle_en)){
    $d->subtitle_en = NULL;
}
if(!isset($d->subtitle_fr)){
    $d->subtitle_fr = NULL;
}
if(!isset($d->subtitle_be)){
    $d->subtitle_be = NULL;
}
if(!isset($d->description)){
    $d->description = NULL;
}
if(!isset($d->description_en)){
    $d->description_en = NULL;
}
if(!isset($d->description_fr)){
    $d->description_fr = NULL;
}
if(!isset($d->description_be)){
    $d->description_be = NULL;
}

if(!isset($d->pricebuy)){
    $d->pricebuy = 0;
}
if(!isset($d->pricesell)){
    $d->pricesell = 0;
}
if(!isset($d->qty)){
    $d->qty = 0;
}
if(!isset($d->obs)){
    $d->obs = NULL;
}

if(isset($d->id) && $d->id != NULL){
    

    
    $result = mysql_query(sprintf("UPDATE product SET name = '%s', type = '%s', subtitle = '%s',"
            . " subtitle_en = '%s', subtitle_fr = '%s', subtitle_be = '%s',description = '%s',description_en = '%s',"
            . "description_fr = '%s',description_be = '%s', pricebuy = %s,pricesell = %s,"
            . "qty = %s, image = '%s',packing = %s,obs='%s'"
            . " WHERE id = %s",
            addslashes($d->name),$d->type,$d->subtitle,$d->subtitle_en,$d->subtitle_fr,$d->subtitle_be,
            addslashes($d->description),addslashes($d->description_en),addslashes($d->description_fr),addslashes($d->description_be),
            $d->pricebuy,$d->pricesell,$d->qty,$d->image,
            $d->packing,$d->obs,$d->id));
  
    
    if($result){
        echo 'Atualizado ';
        return;
    }else {
         echo "Erro  ".$result;
     }
} else {
//
    $result = mysql_query(sprintf("INSERT INTO product(name,type,subtitle,subtitle_en,subtitle_fr,subtitle_be,"
            . "description,description_en,description_fr,description_be,"
            . "pricebuy,pricesell,qty,image,packing,obs)"
            . " VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s',%s,%s,%s,"
            . "'%s',%s,'%s')",
            addslashes($d->name),$d->type,$d->subtitle,$d->subtitle_en,$d->subtitle_fr,$d->subtitle_be,
            addslashes($d->description),addslashes($d->description_en),addslashes($d->description_fr),addslashes($d->description_be),
            $d->pricebuy,$d->pricesell,$d->qty,$d->image,
            $d->packing,$d->obs));
    
   if($result){
       echo "inserido";
       $data = array();
        $result = mysql_query("SELECT * FROM product");
        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
//    return;
   }
} 