<?php
    require_once "./conn.db.php";

    $table = 'anagrafica';
    $myDB=new mysqli($host, $user, $pass, $db);
	
	$result = $myDB->query("SELECT log.ID, anagrafica.nome, deskentratauscita.desk, log.time FROM (log INNER JOIN anagrafica ON log.userID=anagrafica.ID) INNER JOIN deskentratauscita ON log.entrataUscita=deskentratauscita.ID WHERE 1 ORDER BY log.ID");
	$rows = [];

	while($row = $result->fetch_assoc())
		$rows[] = $row;
	
	echo json_encode($rows,  JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE );