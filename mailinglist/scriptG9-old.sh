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
	# On commence par tester la version de bash utilisée
	if [ "${BASH_VERSION:0:1}" -lt 4 ]; then
		echo "Votre version de bash n'est pas compatible avec ce script... Utilisez la version 4 !"
	else
		echo "--- Statistiques sur la mailing list '$1'"
		echo " "

		# --EXPEDITEURS
		echo "-- EXPEDITEURS"

		# On déclare le tableau qui sotckera tous les expéditeurs et le nombre de fois où ils apparaissent
		unset SENDERS
		declare -A SENDERS

		# On cherche tous les expéditeurs, entourés par "From: " et " at"
		while read LINE; do
			if [ -z "${SENDERS["$LINE"]}" ]; then
				COUNT=1
			else
				COUNT="${SENDERS["$LINE"]}"
				let COUNT=COUNT+1
			fi
			SENDERS["$LINE"]="$COUNT"
		done < <(grep "(?<=^From: ).+(?= at)" $1 -Po) #Le GREP est mis à la fin de la boucle pour éviter que le pipe et le "read" n'effacent la variable SENDERS

		# On trie le tableau des expéditeurs dans l'ordre croissant
		# sort -rn -k3 permet de trier numériquement d'après le 3ème mot de la ligne
		
		for NAME in "${!SENDERS[@]}"; do
			echo "$NAME - ${SENDERS["$NAME"]} envois"
		done |
		sort -rn -k3 | head -n 15

		pause

		# --COMPTAGE DES MOTS
		echo "-- MOTS"
		echo " "
		echo "Comptage des mots..."

		# On déclare le tableau qui sotckera tous les mots et le nombre de fois où ils apparaissent
		unset WORDS
		declare -A WORDS

		# On compte le nombre d'occurence de tous les mots de la mailing list
		while read LINE; do

			# On est obligé de supprimer les astérisques, car bash les remplace par la liste des fichiers du dossier courant...
			for WORD in ${LINE//\*/ }; do
		        if [ -z "${WORDS["$WORD"]}" ]; then
		        	WORDS["$WORD"]=1
		        else
		        	COUNT="${WORDS["$WORD"]}"
		        	let COUNT=COUNT+1
		        	WORDS["$WORD"]="$COUNT"
		        fi
		        if [ "$WORD" == "scriptG9.sh" ]; then
		        	echo $LINE
		        	sleep 1
		        fi
		    done
			
		done < <(cat $1)

		# On trie le tableau des mots dans l'ordre croissant, et on ne garde que les 15 premiers
		echo " "

		for WORD in "${!WORDS[@]}"; do
			echo "$WORD - ${WORDS["$WORD"]}"
		done |
		sort -rn -k3 | head -n 15


	fi

fi
