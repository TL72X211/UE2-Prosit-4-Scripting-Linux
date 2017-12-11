#!/bin/sh

#Ce script permet de faire une sauvegarde complète de son système, dans le dossier  /sauvegardes situé dans la racine.
echo "Création de l'archive";

#On récupère la date du jour
jour=$(date +%Y%m%d) # date est une commande donc je change de nom

# On crée l'archive .tar en précisant entre guillemets les chemins absolus des dossiers à sauvegarder.
#On va copier /etc /root /home /var /usr/local, mais on peut en copier d'autres.

tar -cvzf /sauvegardes/backup$jour.tar.gz "/etc/" "/root" "/home" "/var" "/usr/local"

echo "------------------------------------------------------";

echo "Vérification de l'existence de l'archive";

# On teste si l'archive a bien été créée
#-e pour vérifier l'existance 
if [ -e /sauvegardes/backup$jour.tar.gz ]

then

echo "Votre archive a bien été créée.";

else

echo "Il y a eu un problème lors de la création de l'archive.";

fi


echo "### Fin de la sauvegarde.  ###";


