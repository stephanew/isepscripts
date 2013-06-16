#Ce code permet d'afficher le nombre de "Je valide, c'est une VDM" de la catégorie "argent" Pour cela, il faut d'abord se placer dans le répertoire de la catégorie "argent" ou "amour" au choix 

#!/bin/sh
while true; do
read -p "Argent ou amour ? " var # demande à l'utilisateur de choisir 
  case $var in # test les entrées
	argent) cd argent
	echo "voic les résultats de la catégorie argent" 
	break;; #arrete la boucle 
	amour) cd amour 
	break; # arrete la boucle
	echo "voic les résultats de la catégorie amour";;
*) echo "mauvaise entrée";; esac 
done;

dossier=`echo ${PWD##*/}`; #je garde le nom du dossier dans une variable
for i in `ls` #je parcours tous les fichiers dans le dossier
do

grep '>je valide, c' $i | while read line;
do
tmp=${line##?*est une VDM</a> (<span class=}; # j'extrais le nombre de "Je valide, c'est une VDM" en indiquant ce qui est écrit avant dans le code source
url=${tmp%%\</span>?*}; #J'indique ce qui se trouve dans le code source après l'information que je souhaite récupérer
tmp2=${url##?*>};
echo $tmp2 

done
done
 
# Kamaly SAMMANDAMOURTHY et caroline ROMAIN  
