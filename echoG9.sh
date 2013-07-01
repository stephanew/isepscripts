#!/bin/sh
echo "Please enter some input: "

if [ $# -eq 0 ]
then
echo "Entrez un nom de fichier à ouvrir."
else
COUNT=0
cat -s $1 | while read LINE
do
	COUNT=$(($COUNT + 1))
	COLOR=$(($COUNT % 7 + 31))
	echo -e "\033["$COLOR"m"$LINE
	echo -en "\033[0m"

	for WORD in $LINE; do
		echo -en "$WORD "
		if [ "$WORD" == "scriptG9.sh" ]; then
	    	sleep 1
	    fi
	done
done


fi
