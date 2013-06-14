#Ce code permet d'afficher le nombre de "Je valide, c'est une VDM" de la catégorie "argent" Pour cela, il faut d'abord avoir téléchargé le site vie de merde dans son dossier personnel
#L'utilisateur peut à présent choisir la catégorie dont il souhaite avoir le classement de 'Je valide c'est une VDM'
#Les valeurs extraites sont stockées dans un fichier texte et on affiche en console un classement (valeurs affichées dans l'ordre décroissant)
#Le système récupère maintenant le pseudo de la personne qui a posté le post.Le système récupère maintenant le pseudo de la personne qui a posté le post. On a alors un classement à deux colonnes avec le nombre de vote, et le pseudo de la personne ayant posté le post.

#!/bin/sh
echo "Entrez le nom d'une catégorie: " #On affiche à l'écran le texte indiqué qui invite l'utilisateur à entrer le nom d'une catégorie
read word #On récupère la catégorie entrée par l'utilisateur
 while true; do
  case $word in # teste les entrées
  "argent" | "amour" | "travail" | "animaux")  # contrôle les catégories
cd www.viedemerde.fr/$word # On se place dans le répertoire www.viedemerde.fr et ensuite dans le répertoire correspondant à la catégorie choisie
echo 'Voici les résultats de la catégorie '$word ;
   break;; # arrete la boucle
*) echo "la catégorie n'existe pas";; esac 
done;

dossier=`echo ${PWD##*/}`; #je garde le nom du dossier dans une variable
if [ -f ../classement.txt ] #On vérifie si le fichier classement.txt existe déjà
then
# si les fichiers existent:
rm ../classement.txt  #On efface le fichier classement.txt existant

touch ../classement.txt; #On recrée les fichiers classement.txt comme ça on a un fichier texte vide
else  
   touch ../classement.txt; #On crée les fichiers classement.txt
fi
for i in `ls` #je parcours tous les fichiers dans le dossier
do

grep '>je valide, c' $i | while read line;
do
tmp=${line##?*est une VDM</a> (<span class=}; # j'extrais le nombre de "Je valide, c'est une VDM" en indiquant ce qui est écrit avant dans le code source
url=${tmp%%\</span>?*}; #J'indique ce qui se trouve dans le code source après l'information que je souhaite récupérer
tmp2=${url##?*>};
tmp3=${line##?*>$dossier</a> - par}; #On indique ce qu'il y a dans le code source avant le pseudo
url2=${tmp3%%\</p></div></div><div class=*}; #J'indique ce qui se trouve dans le code source après l'information que je souhaite récupérer
incre="0";
pseudo="";
for mot in $url2; do #Grace a la boucle, on lit mot par mot la chaine de caractère url2 car on ne veut récupérer que le pseudo
if [ $incre -eq "0" ]
then
pseudo=$mot;
incre="1";
fi
done


echo  $tmp2" - "$pseudo >> ../classement.txt; #On imprime les valeurs dans le fichier classement.txt

done
done
sort -r ../classement.txt; #On trie par ordre décroissant les éléments du fichier classement.txt et on affiche dans la console la liste des valeurs dans l'ordre décroissant, ainsi nous avons un classement
