###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(phone_brand_device_model)
	#Premières 5 lignes
		head(phone_brand_device_model)
	#Description des variables numériques
		numSummary(phone_brand_device_model)
	#Description des variables textuelles/factorielles
		charSummary(phone_brand_device_model)

## Exploration/traitement spécifique
# Il faut définitivement traiter les phone_brand et les device_model pour avoir quelque chose de consistant

#######