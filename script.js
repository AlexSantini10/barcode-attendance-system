
document.addEventListener('DOMContentLoaded', async () => {

    // Log
    //console.log('here');
    const table = document.getElementById('table-body');

    const relLog = async () => {
        fetch('./get_nomi.php', { method: 'GET' })
        .then(res => res.json())
        .then(json => {

            table.innerHTML="";
            console.log("reload/load");
            json.forEach(element => {
                //console.log(element)
                let tr = document.createElement('tr');

                table.appendChild(tr);

                let id = document.createElement('th');
                id.innerHTML = '' + element.ID;
                tr.appendChild(id);

                let nome = document.createElement('th');
                nome.innerHTML = '' + element.nome;
                tr.appendChild(nome)

                let entrataUscita = document.createElement('td');
                entrataUscita.innerHTML = element.desk
                tr.appendChild(entrataUscita);

                let tempo = document.createElement('td');
                tempo.innerHTML = '' + element.time;
                tr.appendChild(tempo);
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
            console.log(json[0].isToUpdate);
            if(json[0].isToUpdate==1){
                relLog();
                console.log("qui");

                setUpdated();
            }
        })
        .catch(err => console.log(err));
    }
   
    //Chiama le funzioni prima dell'intervallo
    // d
    relLog()
    setInterval(checkForUpdate, 1000);

});