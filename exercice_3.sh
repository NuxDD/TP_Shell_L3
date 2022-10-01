#!/bin/sh

# On commence par récupérer les informations user dans /etc/passwd
# Les noms champ 1 et le nombre associé champ 3 après découpage par
# cut -d: (séparateur :)
# Notez la double parenthèse autour de la commande ! Elles sont nécessaire
# pour avoir un ""array-type"", utile pour la boucle ci-dessous.
NAME=($(cut -d: -f1 /etc/passwd))
NBR=($(cut -d: -f3 /etc/passwd))

# Pour changer, pourquoi pas une boucle comme on le fait en C par exemple...
# On récupère la ""taille"" de l'""array"" via la variable ${#ARRAY[@]}
# Notez la double parenthèse ici, une fois de plus !
for ((i=0 ; i < ${#NAME[@]} ; ++i)); do

	# On teste la valeur du nombre pour s'assurer que nous traitons un
	# utilisateur ordinaire
	if [ ${NBR[$i]} -ge 1000 ]; then

		# On affiche le nom de l'utilisateur et son nombre associé
		echo ${NAME[$i]}:${NBR[$i]}

	fi
done
