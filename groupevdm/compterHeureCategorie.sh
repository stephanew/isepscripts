#ici la fonction est plus complète. En plus d'enregistrer la date et l'heure, elle isole l'heure dans un second fichier
# trie les heures dans un troisième fichier pour compter le nombre d'occurence dans un quatrième. Les fichiers intermédiaires
# sont supprimés et il ne reste que le dernier

# /!\ Ce fichier est à placer dans le même répertoire que le dossier www.viedemerde.fr
# ensuite exécutez le dans le dossier de la catégorie choisie, exemple www.viedemerde.fr/amour/
# puis ajouter la commande suivante > sh ../../compterHeureCategorie.sh


#!/bin/bash
dossier=`echo ${PWD##*/}`; # on garde en mémoire le nom du dossier
echo " création fichier temporaire stats_"$dossier".txt";
for i in `ls`
do
n="0";
grep 'Le [0-3][0-9]/[0-1][0-9]/20[0-1][0-9] à [0-2][0-9]:[0-5][0-9]' $i | while read line; # on cherche les lignes où il y a une date de ce type
do 
if [ $n -eq "0" ] # si c'est la première ligne du fichier alors on va la traiter
then
tmp=${line##?*</p><p>Le}; # on l'isole en fonction des balisent qui entourent la date d'un coté
url=${tmp%%\-?*};  # et de l'autre coté
deb=${url##?*à}; # ensuite on extrait l'heure qui se trouve après le "à"
fin=${deb%%\:?*}; # et avant ":"
echo $fin >> ../../stat_$dossier.txt; # on sauvegarde dans un fichier .txt
n="1";
fi
done
done # fin de la lecture du fichier "VDM"

echo "triage en cours";
sort -o ../../heure_$dossier.txt ../../stat_$dossier.txt

echo "suppression du fichier temporaire";
rm ../../stat_$dossier.txt;

#****************************
#*** FIN PREMIERE PARTIE
#*** DEBUT SECONDE PARTIE
#****************************

echo "création du fichier heure_"$dossier".txt"; # on affiche sur la console l'état de la procédure
echo "création du fichier nbreHeure_"$dossier".txt";

heureStock=""; # on initialise une variable de référence pour l'heure
compte=0; # et une variable d'occurence


while read line; # pour chaque ligne du fichier précédemment créé dans la première boucle 
do 
if [ $compte -lt 1 ] #comparaison pour tester si la boucle commence ou pas
then # si c'est le cas alors la variable de référence est vide

heureStock=$line; #elle prend la variable de la ligne en cours
compte=1; # et commence l'incrémentation

elif [ ${heureStock} -eq ${line} ] # si la ligne suivante est la même que la variable de référence, 
then # alors on n'a pas changé d'heure donc la variable de comptage incrémente

compte=$((compte+1));


elif [ $line -lt 24 ] && [ $line -ge 0 ] # si la ligne lue est bien un nombre entre 0 et 24 mais différente de la variable de référence
then # alors enregistrement les informations
echo $heureStock"H" >> ../../nbreHeure_$dossier.txt;
echo $compte >> ../../nbreHeure_$dossier.txt;
heureStock=$line; # puis on assigne les nouvelles variables pour un nouveau comptage
compte=1;
fi
done < ../../heure_$dossier.txt # on indique à partir de quel fichier la lecture s'effectue

echo $heureStock"H" >> ../../nbreHeure_$dossier.txt; # on enregistre les dernière variables (soit pour 23h)
echo $compte >> ../../nbreHeure_$dossier.txt;
echo "suppression du fichier heure_"$dossier".txt";
rm ../../heure_$dossier.txt; # puis on supprime le fichier qui désormais n'est plus utile
echo "fin comptage occurance. Résultat dans le fichier nbreHeure_"$dossier".txt";

#************************
#*** FIN SECONDE PARTIE
#*** FIN DU PROGRAMME

# NB : supprimer le dernier fichier créé avant de retester car les données se superposeront
# NB : le programme peut être long et quelques messages apparaissent pour indiquer l'avancement
