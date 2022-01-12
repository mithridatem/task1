//afficher la liste des utilisateurs
//url api
const url = 'task.php?user';

//zone pour afficher le contenu de l'api
let zone = document.querySelector('#zone');

//fonction récupération et affichage du json dans la page
async function showUserApi(){
    const data =  await fetch(url);
    const json =  await data.json();
    for(let i in json){
        zone.innerHTML += "<p> id : " + json[i].id_user + ", Nom : " + json[i].name_user + ", Prénom : " + json[i].first_name_user + ", Login : " + json[i].login_user + ", Mdp : " + json[i].mdp_user + "</p>"; 
    }
}
showUserApi();

