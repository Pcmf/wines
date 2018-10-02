<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once '../man/phpMan/openCon.php';

$data = file_get_contents("php://input");
$contact = json_decode($data);
$c = json_decode($contact->data);

$result = mysql_query(sprintf("INSERT INTO contacts(name,phone,contactdate) VALUES('%s','%s',NOW())",
        $c->callmename,$c->callmephone));
if($result){
    echo '1';
} else {
    echo '0';
}
