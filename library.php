<?php
    function PAR($indice)
        {
            //$_POST non esiste
            //lo scope delle variabili è rovesciato. All' interno delle funzioni non si vedono le variabili globali
            global $_POST, $_GET;  //global specifica che le variabili che seguono sono globali
            
            return addslashes(isset($_GET[$indice]) ? $_GET[$indice]:(isset($_POST[$indice]) ? $_POST[$indice]:''));
        }
?> 