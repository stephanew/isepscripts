#!/bin/sh

#creation d'un directory

mkdir -p dossier/ssdossier


#on atteint le dossier

cd dossier

#on crée un second sous dossier

mkdir ssdossier2

#on renomme le premier ssdossier crée

mv ssdossier ssdossier1

echo procédure création effectuée

echo contenu du dossier

ls


#on crée un fichier texte dans un des repertoires

cd ssdossier1

touch blabla.txt

echo fichier texte créé

#on remplit le fichier texte

echo "Hello World" >> blabla.txt

echo "Ca a marche" >> blabla.txt

echo fichier texte rempli


#on va copier le fichier texte du ss dossier 1 dans le ss dossier 2

echo on recopie 1 dans 2

cp blabla.txt ../ssdossier2

cd ../ssdossier2
for ((COUNTER=0; COUNTER <=10; COUNTER++))
do
echo "J'aime pas les gourdins" >> blabla.txt
done

#on affiche le contenu du fichier texte copié

less blabla.txt


