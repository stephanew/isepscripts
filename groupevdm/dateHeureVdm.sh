#ce code permet d'extraire la date et l'heure d'une vdm dans le dossier où il est.
#Ensuite, il enregistre la date et l'heure dans un fichier txt du même nom que le dossier (ex amour, argent, animaux etc...)

# /!\ Ce fichier est à placer dans le même répertoire que le dossier www.viedemerde.fr

#!/bin/bash
dossier=`echo ${PWD##*/}`; #je garde le nom du dossier dans une variable

for i in `ls` #je parcours tous les fichiers dans le dossier
do
n="0";

grep 'Le [0-3][0-9]/[0-1][0-9]/20[0-1][0-9] à [0-2][0-9]:[0-5][0-9]' $i | while read line;  #dans chaque fichier je cherche la date et l'heure suivant le format
do 
if [ $n -eq "0" ] #je regarde si je l'ai déjà sauvegardé car plusieurs lignes dans le fichier ont une date et heure du même type
then
tmp=${line##?*</span>)</span></p><p>Le}; # j'extrais la date et heure entre deux chaine de caractères
url=${tmp%%\-?*};  
echo $url >> ../../$dossier.txt; #je l'enregistre dans le fichier qui se retrouvera à la racine de l'exécutable et portera le nom de la catégorie
n="1";
fi
done
done
