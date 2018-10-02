<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../man/phpMan/openCon.php';

$data = file_get_contents("php://input");
$order = json_decode($data);
$o = json_decode($order->data);

$orderList =  serialize($o->orderList);

$result = mysql_query(sprintf("INSERT INTO wineorder(clientname,clientphone,"
        . "clientemail,clientaddress,message,orderlist) "
        . "VALUES('%s','%s','%s','%s','%s','%s')", $o->clientName,$o->clientPhone,
        $o->clientEmail,$o->clientAddress,$o->clientMessage,$orderList));

if($result){
    echo 'Encomenda registada. Obrigado';
}
