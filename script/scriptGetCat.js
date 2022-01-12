//Afficher la liste des catégories
//url api
const url = 'task.php?cat';

//zone pour afficher le contenu de l'api
let zone = document.querySelector('#zone');

//fonction récupération et affichage du json dans la page
async function showCatApi(){
    const data =  await fetch(url);
    const json =  await data.json();
    for(let i in json){
        zone.innerHTML += "<p>id : " + json[i].id_cat + ", Name : " + json[i].name_cat + "</p>"; 
    }
}
showCatApi();