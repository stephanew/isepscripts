#ce code permet de trouver toutes les images de type jpg, gif et png et de les copier dans un dossier 
#en parallèle du nom de dossier
#!/bin/bash
for i in `find -iname "*.jpg*";find -iname "*.gif*";find -iname "*.png*"`
do
cp $i ../dossier
done
