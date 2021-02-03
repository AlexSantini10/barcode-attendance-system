
document.addEventListener('DOMContentLoaded', async () => {

    document.getElementById('submit').addEventListener('click', () => {
        var xhttp = new XMLHttpRequest();

        let codice = document.getElementById('codice').value;
        let nome = document.getElementById('nome').value;
        let cognome = document.getElementById('cognome').value;
        let email = document.getElementById('email').value;
        let abitazione = document.getElementById('abitazione').value;
        let insegnante = document.getElementById('insegnante').value == 'Si' ? 1 : 0;
        let entrato = document.getElementById('entrato').value == 'Si' ? 1 : 0;

        document.getElementById('codice').value = '';
        document.getElementById('nome').value = '';
        document.getElementById('cognome').value = '';
        document.getElementById('email').value = '';
        document.getElementById('abitazione').value = '';
        document.getElementById('email').value  = '';
        document.getElementById('entrato').value  = '';

        xhttp.open("GET", "post_data.php?"+"codice="+codice+'&nome='+nome+'&cognome='+cognome+'&email='+email+'&abitazione='+abitazione+'&insegnante='+insegnante+'&entrato='+entrato, true);
        xhttp.send();

        alert(nome + ' ' + cognome + ' ' + codice + ' inserito')
        
    });

});