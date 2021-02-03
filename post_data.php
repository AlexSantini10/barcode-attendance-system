<?php require_once "./library.php"; ?>
<?php require_once "./conn.db.php"; ?>

<?php

    $debug = FALSE;

    if(PAR('codice')!='' && PAR('nome')!='' && PAR('cognome')!='' && PAR('email')!='' && PAR('abitazione')!='' && PAR('insegnante')!='' && PAR('entrato')!=''){
        if ($debug) echo(PAR('nome'));

        $codice = PAR('codice');
        $nome = PAR('nome');
        $cognome = PAR('cognome');
        $email = PAR('email');
        $abitazione = PAR('abitazione');
        $insegnante = PAR('insegnante');
        $entrato = PAR('entrato');

        $myDB=new mysqli($host, $user, $pass, $db);
        $query = "INSERT INTO anagrafica (codice, nome, cognome, email, abitazione, insegnante, entrato) VALUES ('{$codice}', '{$nome}', '{$cognome}', '{$email}', '{$abitazione}', '{$insegnante}', '{$entrato}')";
        echo($query);
        $myDB->query($query);
    }
?>

