#!/bin/sh

# On commence par initialiser le comportement par défaut
NUMBER=1

# On boucle dans l'ensemble des fichiers ayant pour nom DSCx.jpg
# dans le répertoire passé en paramètre $1
for img in $(ls $1/DSC*.jpg); do

	# On vérifie que le fichier DSC$NUMBER.jpg existe dans le répertoire
	# passé en paramètre $2, si il existe, on incrémente la variable NUMBER
	# On peut facilement récupérer ""le nombre le plus grand"" du répertoire
	# $2 en utilisant un ls et un cut, cependant on ne tiendrait pas compte 
	# d'un potentiel saut de nombre dans le répertoire $2
	while [ -f "$2/DSC$NUMBER.jpg" ]; do
		NUMBER=$((NUMBER+1))
	done

	# Finalement on transfère le fichier du répertoire $1 vers le répertoire $2
	# en le renommant correctement
	mv --verbose $img "$2/DSC$NUMBER.jpg" 

done
