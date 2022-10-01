#!/bin/sh

# Contrairement à la variable $*, "$@" renvoie les arguments sous la forme
# d'un tableau, on peut donc effectuer une boucle for sur chacun de ses éléments
for arg in "$@"; do

	# On commence par afficher les informations via ls, le flag -l est nécessaire
	# pour afficher la totalité de l'information, en particulier les permissions.
	# On passe la sortie via le pipe |
	ls -l $arg | \

	# Afin d'éviter l'output "otal x" dans le cas des répertoires, on travaille
	# la sortie pour supprimer la ligne via un invert match et le symbole regex ^ :
	# ^ permet de fixer une condition sur le début de la ligne à match
	# ATTENTION : le cas total/ ...
	# On passe la sortie via le pipe |
	grep -v "^total" | \

	# On profite du fait que la sortie de ls -l soit toujours formattée pour
	# extraire les caractère 2 à 10, qui sont les permissions (voir ls -l)
	cut -c 2-10

done
