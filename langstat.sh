#!/bin/bash

if [ -f "$1" ] && [ -f dico.txt ] # test si le parametre 1 existe et si c'est bien le fichier dico.txt 
then

	for i in a b c d e f g h i j k l m n o p q r s t u v w x y z  # boucle d'incrementation de l'alphabet

	do 
	
		if [ "$2" != pourcentage ]
		then

			echo "la lettre" $i "apparait dans" `grep -ci $i $1` "mots du fichier" >> tri.txt # test chaqueligne du fichier et envoi la reponse dans le fichier tri.txt en le creant
	
		elif [ "$2" = pourcentage ]
		then

		compteur=`grep -ci $i $1`
		let "compteur=((compteur*100/323577))" # calcule le pourcentage du nombre d'apparition
		
		echo "la lettre" $i "apparait dans" $compteur "% des mots du fichier" >> tri.txt

		fi

	done
 	
	if [ ! "$2" ] || [ "$2" = pourcentage ]  # test qu'il n'y a pas de parametre 2 ou qu'il ai la valeur pourcentage
	then

	cat tri.txt | sort -k6n,6n  # tri en ordre croissant le fichier tri.txt selon sa 6eme colonne en numerique
	rm tri.txt
	
	
	elif [ "$2" = inverse ] # si le parametre 2 est inverse
	then

	cat tri.txt | sort -k6nr,6nr # tri en ordre decroissant le fichier tri.txt selon sa 6eme colonne en numerique
	rm tri.txt 

	else

	rm tri.txt

	fi

else [ ! -f "$1" ]

	echo "ce n'est pas le bon fichier"
fi

