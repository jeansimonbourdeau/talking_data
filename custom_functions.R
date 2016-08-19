importPostgreSQLTable <- function(dbname, host, port, user, password, tablename, rowProp, random) {
	# Initialiser les objets
		temp <- list()
		tempNames <- vector(mode = "character")
		importSummary <- data.frame(id = integer(), tablename = character(), rowProp = numeric(), random = logical(), query = character(), dateTime = as.POSIXct(character()), stringsAsFactors=FALSE)
		
	# Créer la connection à la base de données
		# Establish connection to PoststgreSQL using RPostgreSQL
		drv <- dbDriver("PostgreSQL")
		# Full version of connection setting
		con <- dbConnect(drv, dbname = dbname, host = host, port = port, user = user, password = password)
		
	# Bâtir la requête à exécuter et la rouler
		for (i in 1:length(tablename)){		#Débuter la boucle for qui va itérer pour toutes les tables dans tablename
			
			# Assigner les variables
			tbl <- tablename[i]				# lire le nom de la table à importer
			prop <- rowProp[i]				# lire la proportion d'observations à importer
			rand <- random[i]				# lire si on effectue un import des données de types random ou séquentiel
			dateTime <- Sys.time()			# Date et heure actuelle avant d'exécuter la requête
			
			# Créer la requête sql
			if(rand == TRUE){
				sqlQuery <- paste0("SELECT * FROM ", tbl, " ORDER BY RANDOM() LIMIT (SELECT reltuples::bigint*", prop, " AS estimate FROM pg_class where relname='", tbl, "');")
				} else if(prop != 1){
					sqlQuery <- paste0("SELECT * FROM ", tbl, " LIMIT (SELECT reltuples::bigint*", prop, " AS estimate FROM pg_class where relname='", tbl, "');")
				} else {
					sqlQuery <- paste0("SELECT * FROM ", tbl, ";")
				}
		
			
			# Envoyer la requête et assigner la table dans une liste
			eval(parse(text=paste0(tbl, " <- dbGetQuery(con, sqlQuery)")))  # Cette expression va créer un dataframe avec le nom de la table en exécutant la requête via la connection
			temp[[i]] <- eval(parse(text=tbl))								# Assigner la table i à l'emplacement i de la liste
			tempNames <- c(tempNames, tbl)									# MAJ la liste des noms de tables
			names(temp) <- tempNames										# MAJ les noms de la liste
			
		# Populer la table de synthèse
			# assigner les valeurs
			importSummary[i, 1] <- i			# id
			importSummary[i, 2] <- tbl			# tablename
			importSummary[i, 3] <- prop		# rowProp
			importSummary[i, 4] <- rand		# random
			importSummary[i, 5] <- sqlQuery	# query
			importSummary[i, 6] <- dateTime	#date and time
		}
		
	# Fermer la connection à la base de données
	dbDisconnect(con)
	
	# Créer dans l'environnement global chaque data frame de la list
	list2env(x=temp, envir = .GlobalEnv) # Create objects in Global Env.
	
	# Retourner le data frame synthèse	
	return(importSummary)
}