#!/bin/sh

# On commence par vérifier que le fichier passé en paramètre
# est un fichier d'extension .c
if [[ $1 == *.c ]]; then

	# On récupère le nom du fichier passé en paramètre
	filename="${1%.*}"

	# On touch le fichier header pour le créer
	header=$filename.h
	touch $header

	# On écrit dans le fichier header les directives pré-processeur
	# On utilise le symbole ^^ pour s'assurer que la totalité de la
	# chaine de caractère soit en majuscule
	var=__${filename^^}__

	echo \#ifndef "$var" > $header
	echo \#define "$var" >> $header
	echo \#endif >> $header
fi
