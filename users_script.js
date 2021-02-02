
document.addEventListener('DOMContentLoaded', async () => {

    // Log
    //console.log('here');
    const table = document.getElementById('table-body');

    const relLog = async () => {
        fetch('./get_anagrafica.php', { method: 'GET' })
        .then(res => res.json())
        .then(json => {
            //console.log(json)
            table.innerHTML="";
            json.forEach(element => {
                //console.log(element)
                let tr = document.createElement('tr');

                table.appendChild(tr);

                let id = document.createElement('th');
                id.innerHTML = '' + element.ID;
                tr.appendChild(id);

                let codice = document.createElement('th');
                codice.innerHTML = '' + element.codice;
                tr.appendChild(codice)

                let nome = document.createElement('th');
                nome.innerHTML = '' + element.nome;
                tr.appendChild(nome)

                let cognome = document.createElement('td');
                cognome.innerHTML = element.cognome
                tr.appendChild(cognome);

                let email = document.createElement('td');
                email.innerHTML = '' + element.email;
                tr.appendChild(email);

                let abitazione = document.createElement('td');
                abitazione.innerHTML = '' + element.abitazione;
                tr.appendChild(abitazione);

                let insegnante = document.createElement('td');
                insegnante.innerHTML = '' + element.insegnante == '1' ? 'Si' : 'No';
                tr.appendChild(insegnante);

                let entrato = document.createElement('td');
                entrato.innerHTML = '' + element.entrato == '1' ? 'Si' : 'No';
                tr.appendChild(entrato);
            });

        })
        .catch(err => console.log(err));
    };


    const setUpdated = async () => {
        fetch('./set_updated.php', {method:'GET'})
        .catch(err => console.log(err));
    }

    const checkForUpdate = async () => {
        fetch('./get_update.php', {method:'GET'})
        .then(res => res.json())
        .then(json => {
            if(json[0].isToUpdate==1){
                relLog()

                setUpdated()
            }
        })
        .catch(err => console.log(err));
    }
   
    //Chiama le funzioni prima dell'intervallo
    // d
    relLog()
    setInterval(checkForUpdate, 1000);

});