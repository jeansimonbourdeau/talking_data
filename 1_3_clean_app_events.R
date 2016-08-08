###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(app_events)
	#Premières 5 lignes
		head(app_events)
	#Description des variables numériques
		numSummary(app_events)
	#Description des variables textuelles/factorielles
		charSummary(app_events)
		
## Exploration/traitement spécifique
#event_id 

#app_id

#is_installed
	#changer en variable binaire
	app_events$is_installed <- ifelse(app_events$is_installed == 1, TRUE, FALSE)
#is_active	
	app_events$is_active <- ifelse(app_events$is_active == 1, TRUE, FALSE)
#######