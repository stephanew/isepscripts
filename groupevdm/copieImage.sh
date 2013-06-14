#ce code permet de trouver toutes les images de type jpg, gif et png et de les copier dans un dossier 
#en parallèle du nom de dossier
#!/bin/bash
for image in `find -iname "*.jpg*";find -iname "*.gif*";find -iname "*.png*"`
do
cp -r $image ../image/$image  
convert $image -thumbnail '200x200>' ../images/miniatures/$image # permet de convertir les images 
done
