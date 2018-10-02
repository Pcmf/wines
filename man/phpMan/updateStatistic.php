<?php

/* 
 * update or if new insert statistics by cookies.
 * 
 * 
 */

require_once 'openCon.php';

$data = file_get_contents("php://input");
$dt = json_decode($data);
$parm = json_decode($dt->parms);
if($parm->count > 1){
    $query = sprintf("UPDATE statistics SET counter = %s,lastdate = NOW() WHERE cookie = '%s'"
            ,$parm->count,$parm->hash);
} else {
    $query = sprintf("INSERT INTO statistics(cookie,createdate,counter,lang) VALUES('%s',NOW(),%s,'%s')",
            $parm->hash,$parm->count,$parm->lang);
}
$result = mysql_query($query);

return;