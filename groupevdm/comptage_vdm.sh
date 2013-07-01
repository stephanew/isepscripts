#Ces 2 morceaux de code permettent le comptage du mot VDM dans tous les fichiers
#version longue
#!/bin/bash
$compte=0;
for j in `grep "VDM" *`
do
compte=$((compte + 1));
done
echo $compte;

#version courte
cat * | grep "VDM" *
