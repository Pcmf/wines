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
if(!isset($d->year)){
    $d->year = 0;
}
if(!isset($d->locality)){
    $d->locality = 1;
}
if(!isset($d->soil)){
    $d->soil = 1;
}
if(!isset($d->grapescoll)){
    $d->grapescoll = NULL;
}
if(!isset($d->tasting)){
    $d->tasting = NULL;
}
if(!isset($d->tasting_en)){
    $d->tasting_en = NULL;
}
if(!isset($d->tasting_fr)){
    $d->tasting_fr = NULL;
}
if(!isset($d->tasting_be)){
    $d->tasting_be = NULL;
}
if(!isset($d->service)){
    $d->service = NULL;
}
if(!isset($d->service_en)){
    $d->service_en = NULL;
}
if(!isset($d->service_fr)){
    $d->service_fr = NULL;
}
if(!isset($d->service_be)){
    $d->service_be = NULL;
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
    $result = mysql_query(sprintf("UPDATE wine SET name = '%s', winetype = %s, year = %s, subtitle = '%s',"
            . " region = %s, soil = %s, producer = %s, grapescoll = '%s', tasting = '%s',tasting_en = '%s',"
            . "tasting_fr = '%s',tasting_be = '%s',alcohol = %s, service = '%s', service_en = '%s',"
            . " service_fr = '%s', service_be = '%s', oenologist = %s, pricebuy = %s,pricesell = %s,"
            . "qty = %s, photobottle = '%s',packing = %s, locality=%s,obs='%s'"
            . " WHERE id = %s",
            addslashes($d->name),$d->winetype,$d->year,$d->subtitle,$d->region,$d->soil,$d->producer,$d->grapescoll,
            addslashes($d->tasting),addslashes($d->tasting_en),addslashes($d->tasting_fr),addslashes($d->tasting_be),
            $d->alcohol,addslashes($d->service),addslashes($d->service_en),addslashes($d->service_fr),
            addslashes($d->service_be),$d->oenologist,$d->pricebuy,$d->pricesell,$d->qty,$d->photobottle,
            $d->packing,$d->locality,$d->obs,$d->id));
  
    
    if($result){
        echo 'Atualizado ';
        return;
    }else {
         echo "Erro  ".$result;
     }
} else {
//

    $result = mysql_query(sprintf("INSERT INTO wine(name,winetype,year,subtitle,region,soil,producer,grapescoll,"
            . "tasting,tasting_en,tasting_fr,tasting_be,alcohol,service,service_en,service_fr,service_be,"
            . "oenologist,pricebuy,pricesell,qty,photobottle,packing, locality,obs)"
            . " VALUES('%s',%s,%s,'%s',%s,%s,%s,'%s','%s','%s','%s','%s',%s,'%s',"
            . "'%s','%s','%s',%s,%s,%s,%s,'%s',%s,%s,'%s')",
            addslashes($d->name),$d->winetype,$d->year,$d->subtitle,$d->region,$d->soil,$d->producer,$d->grapescoll,
            addslashes($d->tasting),addslashes($d->tasting_en),addslashes($d->tasting_fr),addslashes($d->tasting_be),
            $d->alcohol,addslashes($d->service),addslashes($d->service_en),addslashes($d->service_fr),
            addslashes($d->service_be),$d->oenologist,$d->pricebuy,$d->pricesell,$d->qty,$d->photobottle,
            $d->packing,$d->locality,$d->obs));
    echo $result;
   if($result){
       echo "inserido";
       $data = array();
        $result = mysql_query("SELECT * FROM wine");
        if($result){
            while ($row = mysql_fetch_array($result)) {
                array_push($data, $row);
            }
        }
        echo json_encode($data);
//    return;
   }
} 