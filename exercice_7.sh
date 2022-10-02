#!/bin/sh

# On utilise find pour parcourir les fichiers/dossiers 
# du répertoire courant (.), on filtre les fichiers ayant
# un temps d'accès >60 jours (-atime 60), puis finalement
# on les supprime (-delete)
find . -atime 60 -delete
