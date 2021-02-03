<!DOCTYPE html>

<?php require_once "./library.php"; ?>
<?php require_once "./conn.db.php"; ?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barcode System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="addUser_script.js"> </script>
</head>
<body class="bg-dark text-white">
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Barcode System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php">Log page</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="users.php">Users page</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="addUser.php">Add an user</a>
            </li>
        </ul>
        </div>
    </div>
    </nav>
 
    <form>
        <div class="form-group" method="post">
            <label for="codice">Codice</label>
            <input type="text" class="form-control" id="codice" placeholder="12345678" name="codice">

            <label for="nome">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome">

            <label for="cognome">Cognome</label>
            <input type="text" class="form-control" id="cognome" name="cognome">

            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email">

            <label for="abitazione">Abitazione</label>
            <input type="text" class="form-control" id="abitazione" name="abitazione">

            <label for="insegnante">Insegnante</label>
            <input type="text" class="form-control" id="insegnante" name="insegnante" placeholder="Si/No">

            <label for="entrato">è nella scuola</label> <!-- (toFinish) inserire parsing tra Si 1 e No 0 --->
            <input type="text" class="form-control" id="entrato" name="entrato" placeholder="Si/No">
        </div>
        <div class="form-group" style="margin-top:10px;">
            <button type="button" class="btn btn-primary" id='submit'>Submit</button>
        </div>
    </form>

    </tbody>
    </table>

    <?php
        if (isset($_POST['codice']) && isset($_POST['nome']) && isset($_POST['cognome']) && isset($_POST['email']) && isset($_POST['abitazione']) && isset($_POST['insegnante']) && isset($_POST['entrato'])){
            $myDB=new mysqli($host, $user, $pass, $db);
            $query = "INSERT INTO anagrafica (codice, nome, cognome, email, abitazione, insegnante, entrato) VALUES ('{$_POST['codice']}', '{$_POST['nome']}', '{$_POST['cognome']}', '{$_POST['email']}', '{$_POST['abitazione']}', '{$_POST['insegnante']}', '{$_POST['entrato']}')";
            $myDB->query($query);
        }
    ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
</body>
</html>