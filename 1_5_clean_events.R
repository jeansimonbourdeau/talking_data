###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(events)
	#Premières 5 lignes
		head(events)
	#Description des variables numériques
		numSummary(events)
	#Description des variables textuelles/factorielles
		charSummary(events)
	#Drop geography column
		events$geog <- NULL
		
## Exploration/traitement spécifique
#event_id 

#device_id

#timestamp
	#Créer des variables de temps supplémentaires
	events$year <- year(events$timestamp)
	events$monthid <- month(events$timestamp)
	events$month <- month(events$timestamp, label = TRUE)
	events$day <- day(events$timestamp)
	events$wdayid <- wday(events$timestamp)	#1 = dimanche
	events$wday <- wday(events$timestamp, label = TRUE)
	events$hour <- hour(events$timestamp)
	events$min <- minute(events$timestamp)
#longitude
	#classer à NA ceux qui sont entre -2 et 2
	events$longitude[events$longitude >= -2 & events$longitude <= 2 & events$latitude >= -2 & events$latitude <= 2] <- NA
#latitude	
	#classer à NA ceux qui sont entre -2 et 2
	events$latitude[events$longitude >= -2 & events$longitude <= 2 & events$latitude >= -2 & events$latitude <= 2] <- NA 	#Entre le quart et le tier des valeurs deviennent NA
#######