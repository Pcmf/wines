<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once 'openCon.php';


$answer = array();

$result = mysql_query(sprintf("SELECT W.*, WT.name AS wtname, WT.name_be AS wtname_be,P.name AS pname, PK.name AS pkname,"
        . " R.name AS rname,S.name AS sname,S.name_en AS sname_en,S.name_fr AS sname_fr,S.name_be AS sname_be,"
        . " L.name AS lname,O.name AS oname"
        . " FROM wine W, winetype WT, producer P, packing PK, region R, soil S, locality L, oenologist O"
        . " WHERE W.winetype = WT.id AND W.producer = P.id AND W.packing = PK.id"
        . " AND W.region = R.id AND W.soil = S.id AND W.locality = L.id AND W.oenologist = O.id "
        . "ORDER BY rname, wtname, name, pricesell DESC"));

if($result){
    while ($row = mysql_fetch_array($result)) {
        $result1 = mysql_query(sprintf("SELECT wid,obs AS dobs FROM destak WHERE wid = %s",$row['id']));
        if($result1){
            $row1 = mysql_fetch_array($result1);
            if($row1){
                $row['destak'] = $row1;
            }
            else{
                $row['destak'] = array('wid'=>0,'dobs'=>'');
            }
        }
      array_push($answer, $row);
    }
    echo json_encode($answer);
}