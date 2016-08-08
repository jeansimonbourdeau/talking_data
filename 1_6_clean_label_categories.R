###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(label_categories)
	#Premières 5 lignes
		head(label_categories)
	#Description des variables numériques
		numSummary(label_categories)
	#Description des variables textuelles/factorielles
		charSummary(label_categories)
		
## Exploration/traitement spécifique
#label_id 

#category
	label_categories$category[is.na(label_categories$category)] <- "unknown"			#Pour les valeurs manquantes, inscrire la mention "unknown"

#######