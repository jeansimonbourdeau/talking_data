###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(app_labels)
	#Premières 5 lignes
		head(app_labels)
	#Description des variables numériques
		numSummary(app_labels)
	#Description des variables textuelles/factorielles
		charSummary(events)
		
## Exploration/traitement spécifique
#app_id 

#label_id

#######