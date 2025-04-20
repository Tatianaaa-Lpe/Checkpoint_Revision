#!/bin/bash

#Vérification argument
#S'il n'y a pas les noms utilisateurs en argument ERREUR + SORTIE
if [ $# -eq 0  ]
then       
    echo "Aucun nom utilisateur, ERREUR"
    exit 1
fi
#Vérifier si l'utilisateur existe déjà
for user_Name in $@
do
    if sudo cat /etc/passwd | grep "$user_Name" > /dev/null
    then
        #S'il existe ERREUR SANS SORTIE
        echo "Le nom utilisateur existe déjà"

    else
        #S'il n'existe pas, création de l'utilisateur
        echo "Création de l'utilisateur en cours"
        sudo useradd $user_Name

            if [ $? = 0 ]
            then
                echo "L'utilisateur $@ a bien été créé"
            else
                echo "Erreur à la création de l'utilisateur $@"
            fi
    fi
done
exit 0