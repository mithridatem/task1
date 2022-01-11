<?php

    class Vehicule{
        private $id_vehicule;
        private $nom_vehicule;
        private $color;
        private $nbrRoue;
        

        public function __contruct($nom_vehicule, $color, $nbrRoue){
            $this->nom_vehicule = $nom_vehicule;
            $this->color = $color;
            $this->$nbrRoue = $nbrRoue;
        }
        //getter and setter

        public function getPrixVehicule(){
            return $this->prix_ht_vehicule;
        }
        public function setPrixvehicule($prix){
            $this->prix_ht_vehicule = $prix;
        }
        public function getNomVehicule(){
            return $this->nom_vehicule;
        }
        public function setNomvehicule($nom){
            $this->nom_vehicule = $nom;
        }

        public function calculerTtc(){
            return $this->prix_ht_vehicule*1.20;        
        }
    }




?>