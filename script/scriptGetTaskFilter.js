//éléments HTML(bouton)
let bt = document.querySelector('#bt');
//zone pour afficher le contenu de l'api
let zone = document.querySelector('#zone');
//fonction afficher les tâches (filter)
async function showTaskFilterApi(){
    //vider la zone html
    zone.innerHTML = "";
    //Récupération des dates depuis les éléments HTML(champ input)
    let deb = document.querySelector('#deb').value;
    let end = document.querySelector('#end').value;
    //test si les champs sont remplis
    if(deb != "" && end != ""){
        //construction de l'url (API)
        let url = "task.php?task=1&deb=%22"+deb+'%22&end=%22'+end+"%22";
        //récupération de l'api
        const data =  await fetch(url);
        //formatage en json
        const json =  await data.json();
        //boucle json
        for(let i in json){
            //affichage dans la page
            zone.innerHTML += "<p>id : <span>" + json[i].id_task + "</span>, Nom : <span>" + json[i].name_task + "</span>, Contenu : <span>" + json[i].content_task + "</span>, Date : <span>" + json[i].date_task + "</span></p>"; 
        }
    }
    //sinon affiche une erreur : Veuillez saisir des dates
    else{
        zone.innerHTML += "Veuillez saisir des dates";
    }
}
//appel de la fonction (écouteur d'évènement au clic sur le bouton)
bt.addEventListener('click', showTaskFilterApi);