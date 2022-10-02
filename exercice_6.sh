#!/bin/sh

# On boucle sur l'ensemble des fichiers dont l'extension est .c
for file in $(ls *.c); do

	# On commence par retirer l'extension
	# En réalité ici on pourrait seulement retirer deux caractères
	# de la chaine de caractère (.c), mais la ligne ci-dessous fonctionne
	# pour la totalité des extensions
	filename="${file%.*}"

	# On parcourt les fichiers avec pour point de départ le répertoire
	# courant (.), on filtre uniquement les sorties ayant pour nom
	# $filename.o (-name), on vérifie que ce sont des fichiers (-type f),
	# puis finalement on supprime ces fichiers (-delete)
	find . -name "$filename.o" -type f -delete

done
