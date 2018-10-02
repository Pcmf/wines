<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$c = json_decode($dt->parms);

$query = sprintf("UPDATE contacts SET answer ='Visto', answerdate = NOW() WHERE id= %s",$c->id);

$result = mysql_query($query);

return;