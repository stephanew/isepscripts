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
done

echo -en "\033[0m"
fi
