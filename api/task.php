<?php
    //test si le paramétre task existe
    if(isset($_GET['task'])){
        $tab = array(
            'error' => 'Pas de Json',);
            print_r('{"error" : "'.$tab['error'].'"}');
        //test si le paramétre task existe et égale 1
        if($_GET['task']==1){
            
            if(isset($_GET['deb']) and isset($_GET['end'])){
                $deb = $_GET['deb'];
                $end = $_GET['end'];
                //affiche json (de deb à end)
                echo json_encode(reqDate($deb, $end)) ;
            }
            else{
                //affiche json toutes les taches
                echo json_encode(req()) ;
            }
        }
        else if($_GET['task'] >1){
            $tab = array(
            'error' => 'Pas de Json',);
            print_r('{"error" : "'.$tab['error'].'"}');
        }
    }
    //test si le paramétre user existe
    else if(isset($_GET['user'])){
        //affiche json toutes les utilisateurs
        echo json_encode(reqUser()) ;
    }
    //test si le paramétre cat existe
    else if(isset($_GET['cat'])){
        //affiche json toutes les utilisateurs
        echo json_encode(reqCat()) ;
    }
    else{
        $tab = array(
        'error' => 'Pas de Json',);
        print_r('{"error" : "'.$tab['error'].'"}');
    }
    
    //fonction création de la requéte et exécution retourne une Arraylist
    function req()
    {
        try 
        {   //connexion à la Base de données
            //include('bddConnexion2.php');
            //connexion à la base de données
            $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','',);
            //requete SQL
            $requete = "SELECT * FROM task";

            // Execution de la requéte SQL.
            $reponse = $bdd->query($requete);
            //variable $output (Arraylist) contenant le résultat de la requéte
            $output = $reponse->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (Exception $e) 
        {
            die('Erreur : ' . $e->getMessage());
        }
        //retourne une Arraylist
        return $output;
    }

    //fonction création de la requéte et exécution retourne une Arraylist
    function reqUser()
    {
        try 
        {   //connexion à la Base de données
            //include('bddConnexion2.php');
            //connexion à la base de données
            $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','',);
            //requete SQL
            $requete = "SELECT * FROM user";

            // Execution de la requéte SQL.
            $reponse = $bdd->query($requete);
            //variable $output (Arraylist) contenant le résultat de la requéte
            $output = $reponse->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (Exception $e) 
        {
            die('Erreur : ' . $e->getMessage());
        }
        //retourne une Arraylist
        return $output;
    }
    //fonction création de la requéte et exécution retourne une Arraylist
    function reqCat()
    {
        try 
        {   //connexion à la Base de données
            //include('bddConnexion2.php');
            //connexion à la base de données
            $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','',);
            //requete SQL
            $requete = "SELECT * FROM cat";

            // Execution de la requéte SQL.
            $reponse = $bdd->query($requete);
            //variable $output (Arraylist) contenant le résultat de la requéte
            $output = $reponse->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (Exception $e) 
        {
            die('Erreur : ' . $e->getMessage());
        }
        //retourne une Arraylist
        return $output;
    }


    //fonction création de la requéte et exécution retourne une Arraylist
    function reqDate($deb, $end)
    {
        try 
        {   //connexion à la Base de données
            //include('bddConnexion2.php');
            //connexion à la base de données
            $bdd = new PDO('mysql:host=localhost;dbname=task1', 'root','',);
            //requete SQL
            $requete = "SELECT * FROM task WHERE validate_task = 0 AND 
            date_task BETWEEN $deb AND $end";

            // Execution de la requéte SQL.
            $reponse = $bdd->query($requete);
            //variable $output (Arraylist) contenant le résultat de la requéte
            $output = $reponse->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (Exception $e) 
        {
            die('Erreur : ' . $e->getMessage());
        }
        //retourne une Arraylist
        return $output;
    }
    //fonction encodage du résultat de la requéte au format json
    function encode_to_json()
    {
        $json = json_encode(req());
        return $json;
    }                   
    //fonction décodage du json en ArrayList  
    function decode_to_json()
    {
        $json_decode = json_decode(encode_to_json(),true);
        return $json_decode;
    }
?>
