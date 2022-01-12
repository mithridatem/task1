//afficher la liste des taches (sans filtre)
//url api
const url = 'task.php?task=1';

//zone pour afficher le contenu de l'api
let zone = document.querySelector('#zone');

//fonction récupération et affichage du json dans la page
async function showTaskApi(){
    const data =  await fetch(url);
    const json =  await data.json();
    for(let i in json){
        zone.innerHTML += "<p> id : " + json[i].id_task + ", Nom : " + json[i].name_task + ", Contenu : " + json[i].content_task + ", Date : " + json[i].date_task + "</p>"; 
    }
}
showTaskApi()