#!/usr/bin/bash


# OBJECTIFS (n'hesitez pas a en rajouter d'autres !)
# - Compter le nombre de mots [OK]
# - Compter le nombre moyen de mots par mail [OK]
# - Trouver les mots les plus courants [OK]
# - Liste de tous les expediteurs [OK]
# - Nombre de mails envoyés par chacun [OK]
# - Nombre de mails envoyés par mois [OK]
# - Les mois où le plus d'emails ont été envoyés [OK]

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
	grep "(?<=^From: )[\w]+ at [\w\.]+" $1 -Po | sort -rn -k1 | uniq -c | sort -rn -k1 | head -n 15 | sed 's/ at /@/g' 
	pause

	# --COMPTAGE DES MOTS
	echo "-- MOTS"
	echo " "

	# La regex de grep correspond à toutes les chaines de caractères qui ne contiennent pas d'espaces
	grep "[^\s]+" $1 -Po | sort -rn -k1 | uniq -c | sort -rn -k1 | head -n 15

	# La commande Sed permet d'enlever les espaces au début du résultat
	TOTALWORDS=`wc -w < $1 | sed -e 's/^[ \t]*//'`
	echo "TOTAL: $TOTALWORDS"
	pause

	echo "-- NOMBRE DE MOTS PAR MAIL"
	echo " "

	# -- NOMBRE DE MOTS PAR MAILS
	COUNTMAILS=`grep "(?<=^From: ).+(?= at)" $1 -Po | wc -l | sed -e 's/^[ \t]*//'`
	# La commande bc permet d'effectuer l'opération de division
	echo $(echo "$TOTALWORDS / $COUNTMAILS" | bc -l )
	pause

	# -- MAILS PAR MOIS
	echo "-- MOIS D'ENVOIS"
	echo " "
	grep "^From .+ at .+$" $1 -Po | grep "(?<=(Sun|Mon|Tue|Wed) )[\w]+(?= \d)" -Po | sort -rn -k1 | uniq -c | sort -rn -k1 | head -n 15
	pause





fi