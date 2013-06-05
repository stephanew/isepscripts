#!/usr/bin/bash


# OBJECTIFS (n'hesitez pas a en rajouter d'autres !)
# - Compter le nombre de mots
# - Compter le nombre moyen de mots par mail
# - Trouver les mots les plus courants
# - Liste de tous les expediteurs
# - Nombre de mails envoyés par chacun
# - Nombre de mails envoyés par mois
# - Les mois où le plus d'emails ont été envoyés

# FONCTION UTILE
function pause(){
	echo "Appuyez sur Entrée pour continuer..."
	read -p "$*"
}

if [ $# -eq 0 ]; then
	echo "Entrez un nom de fichier mailinglist"
else
	echo "--- Statistiques sur la mailing list '$1'"
	echo " "

	# --EXPEDITEURS
	echo "-- EXPEDITEURS"
	echo " "
	grep "(?<=^From: ).+(?= at)" $1 -Po | sort -rn -k1 | uniq -c | sort -rn -k1 | head -n 15
	pause

	# --COMPTAGE DES MOTS
	echo "-- MOTS"
	echo " "

	# La regex de grep correspond à toutes les chaines de caractères qui ne contiennent pas d'espaces
	grep "[^\s]+" $1 -Po | sort -rn -k1 | uniq -c | sort -rn -k1 | head -n 15
	echo "TOTAL:`wc -w < $1`"
	echo " "

	# Nombre de mots par mails
	#grep "[^\s]+" $1 -Po | wc -l

fi
