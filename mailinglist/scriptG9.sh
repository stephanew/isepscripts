#!/usr/bin/bash


# OBJECTIFS (n'hesitez pas a en rajouter d'autres !)
# - Compter le nombre de mots
# - Compter le nombre moyen de mots par mail
# - Trouver les mots les plus courants
# - Liste de tous les expediteurs
# - Nombre de mails envoyés par chacun
# - Nombre de mails envoyés par mois
# - Les mois où le plus d'emails ont été envoyés

if [ $# -eq 0 ]; then
	echo "Entrez un nom de fichier mailinglist"
else
	# On commence par tester la version de bash utilisée
	if [ "${BASH_VERSION:0:1}" -lt 4 ]; then
		echo "Votre version de bash n'est pas à jour pour ce script... Utilisez la version 4 !"
	else
		echo "--- Statistiques sur la mailing list '$1'"
		echo " "

		# EXPEDITEURS

		# On déclare le tableau qui sotckera tous les expéditeurs et le nombre de fois où ils apparaissent
		unset SENDERS
		declare -A SENDERS
		TEST="aaa"

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
		echo "-- EXPEDITEURS"
		for NAME in "${!SENDERS[@]}"; do
			echo "$NAME (${SENDERS["$NAME"]} envois)"
		done |
		sort -rn -k3

		
	fi

fi
