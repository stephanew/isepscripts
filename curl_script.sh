#!/bin/bash

echo "Bienvenue sur mon script"
echo "Entrez l'URL du site que vous souhaitez analyser"
read url
echo "Vous avez choisi : $url"

#on verifie que le site existe:
curl -s --head $url | head -n 1 | grep "OK"
#Le -s permet d'eviter la barre de chargement de curl

if [ "$?" -eq "0" ]
then
#Le site existe, on l'analyse
echo "L'url : $url est correcte"
curl -s $url > retour_curl.txt
date=`date`
echo "$date" 
#on a stocké le resultat du curl dans un fichier txt
retour_grep=$(cat retour_curl.txt | grep -o "Le 11/06/2013") 
echo "$retour_grep"
#on récupere les vdm publié le 07/06/2013
 

else
echo "L'url donnée n'est pas correcte"
fi

#On signale la fin du script
echo "Fin du script"