#!/bin/sh

# On boucle dans l'ensemble des arguments passés en paramètre
for arg in "$@"; do
	
	# On utilise une propriété du sh, à savoir qu'un opérateur
	# de comparaison entre nombres utilisé avec des arguments qui
	# ne sont pas des nombres renverra toujours faux. Ainsi, si 
	# $arg est un nombre, alors on affiche un message sinon on
	# passe au prochain paramètre.
	# On peut, si on le souhaite, rediriger la sortie vers /dev/null
	# via 2>/dev/null pour éviter les message en cas de retour faux
	if [ $arg -eq $arg ]; then
	  echo $arg "est un nombre !"
	fi

done
