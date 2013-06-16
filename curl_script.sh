#!/bin/bash

echo "Bienvenue sur mon script"
url=" www.viedemerde.fr"
echo "Le site actuellement configuré est : $url"
#on propose à l'utilisateur la section qu'il souhaite consulter
echo "1:Amour         5: Animaux"
echo "2: Argent       6: Enfants"
echo "3: Travail      7: Santé"
echo "4 : Sexe        8: Inclassable"
#on demande a l'utlisateur la section qui souhaite
read section
#le case permet d'instancier l'url
case $section in
    1 ) url="www.viedemerde.fr/amour" ;;
    2 ) url="www.viedemerde.fr/Argent" ;;
    3 ) url="www.viedemerde.fr/Travail" ;;
    4 ) url="www.viedemerde.fr/Sexe" ;;
    5 ) url="www.viedemerde.fr/Animaux" ;;
    6 ) url="www.viedemerde.fr/Enfants" ;;
    7 ) url="www.viedemerde.fr/Santé" ;;
    8 ) url="www.viedemerde.fr/Inclassable" ;;
    * ) echo "All your base belong to us" ;;
    #La valeur par defaut est la page d'acceuil
esac
echo "Vous avez choisi : $url"

#on verifie que le site existe:
curl -s --head $url | head -n 1 | grep -o "OK" 
#Le -s permet d'eviter la barre de chargement de curl

if [ "$?" -eq "0" ]
then
#Le site existe, on l'analyse
echo "L'url : $url est correcte"
curl -s $url > retour_curl.txt
#On a stocké l'integralité de la page curler dans un fichier dedié
date=`date +%d/%m/%Y`
#On recupere la date du jour au format: dd/mm/YYYY
#grep -e "\(0[1-9]\[1-2][0-9]\3[0-1]\)" -f $date
retour_grep=`cat retour_curl.txt | grep \$date` 
#on recherche les post du jour grace a la date
echo "ICI ==> $retour_grep"
#on récupere les vdm publié le 07/06/2013


else
echo "L'url donnée n'est pas correcte"
fi
#On signale la fin du script
echo "Fin du script"