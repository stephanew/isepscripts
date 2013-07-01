#chmod
#chmod pert de gérer les droits d'utilisation d'un fichier

# r : autorisation de lecture
# w : autorisation  d'écriture
# x : autorisation d'execution
# coucou youpihou

chmod -v 777 NomFichier
#affiche la liste de tous les fichiers en cours de modification.

chmod -c 777 NomFichier
#comme -v mais n'affiche que les changements effectués.

chmod -f 777 NomFichier
#supprime la plupart des messages d'erreur.
  
chmod -R 777 NomFichier
#change les modes de tous les fichiers dans les sous-répertoires de manière récursive.

chmod --help 
#affiche l'aide de la commande chmod.

chmod --version 
#affiche les informations sur la version de chmod.
