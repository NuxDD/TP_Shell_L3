#!/bin/sh

for arg in "$@"; do

	# On commence par vérifier si $arg est un fichier
	# Conditions nécessaire pour les liens symboliques, par ex.
	if [ -f $arg ]; then

		# Retourne la dernière date d'accès de $arg grâce au 
		# paramètre -d
		date -d $arg

	# ATTENTION : date -d ne fonctionne pas sur les répertoires
	# on ajoute alors une condition pour ceux-ci. Ce date -d est
	# purement pédagogique, en réalité la ligne ci-dessous fonctionne
	# dans tous les cas, fichiers ou répertoires.
	elif [ -d $arg ]; then

		# On affiche toute les informations sur $arg, en particulier
		# la dernière date d'accès via le --time=atime. (voir ctime/atime...)
		ls -l --time=atime $arg | \

		# On travaille sur le sortie de ls pour s'assurer que le formatage n'induit
		# pas de soucis pour le cut ci-dessous. 
		tr -s ' ' | \

		# On récupère uniquement les informations liées à la date d'accès.
		cut -d' ' -f6-8

	fi

done
