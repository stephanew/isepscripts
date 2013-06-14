#!/bin/bash
# avant de lancer ce sript, il faut lancer le script   dans chaque categorieCompterHeure.sh dans chaque catégorie de vdm
# ce script permet de faie une synthèse et de définir les meilleurs catégori/ par heure

#variable dans laquelle sera stocké  la catégorie gagnante pour chaque heure
categorieGagnanteHeure = ('0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0')

#variable où sont stocké les catégories
nomCategorie = ('amour' 'animaux' 'argent' 'blog' 'enfants' 'travail' 'sexe' 'sante' 'inclassable')

#variable pour suivre les catégories en cours d'étude
i=0

maLigne = 0

monHeure=0

#variable contenant le fichier à étudier
fichier=${nomCategorie[$i]}/nbreHeure_${nomCategorie[$i]}.txt

#on va répéter 9 fois le code suivant en incrémentant à chaque fois i donc aussi la catégorie
#le code parcourira ainsi tous les fichiers crées
while[$i<9];do

  #on parcourir un fichier
  for line in $fichier
    do 
      
      #on incrémente une variable pour savoir si on se trouve sur une ligne impaire
      $maLigne = $maLigne+1

      #on passe une ligen sur deux car seules résultats nous intéresse
      if[maLigne%2=0]
      then
	
	#on regarde si la catégorie pour l'heure donnée est gagnante par rapport au précédentes
	if [line > $catagorieGagnanteHeure[$monHeure]]
	then
	  #si oui, on la place dans la variable categorieGagnateHeure à la bonne place
	  $catagorieGagnanteHeure[$monHeure]=$nomCategorie[$i]
	 #on incrémente l'heure
	 monHeure=monHeure+1
	fi
      
      fi
      
      #on incrémente la ligne
      $maLigne=$maLigne+1
     	
    done
    
    #on réinitialise l'heure
   monHeure=0
  $i=$i+1q
done
