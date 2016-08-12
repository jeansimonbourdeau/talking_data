
importPostgreSQLTable <- function(_dbname_, _host_, _port_, _user_, _password_, tablename, rowProp, random){
	# Créer la connection à la base de données
		# Establish connection to PoststgreSQL using RPostgreSQL
		drv <- dbDriver("PostgreSQL")
		# Full version of connection setting
		con <- dbConnect(drv, dbname=_dbname_ ,host=_host_,port=_port_,user=_user_,password=_password_)
		
	# Bâtir la requête à exécuter et la rouler
		for (i in 1:length(tablename)){		#Débuter la boucle for qui va itérer pour toutes les tables dans tablename
			
			# Assigner les variables
			tbl <- tablename[i]				#lire le nom de la table à importer
			prop <- rowProp[i]				#lire la proportion d'observations à importer
			rand <- random[i]				#lire si on effectue un import des données de types random ou séquentiel
			
			# Créer la requête sql
			if(random == TRUE){
				sqlQuery <- paste0("SELECT * FROM ", tbl, " ORDER BY RANDOM() LIMIT (SELECT reltuples::bigint*", prop, " AS estimate FROM pg_class where relname='", tbl, "');")
				} else if(prop != 1){
					sqlQuery <- paste0("SELECT * FROM ", tbl, " LIMIT (SELECT reltuples::bigint*", prop, " AS estimate FROM pg_class where relname='", tbl, "');")
				} else {
					sqlQuery <- paste0("SELECT * FROM ", tbl, ";")
				}
			}
			
			# Envoyer la requête et créer la table
			eval(parse(text=paste0(tablename, " <- dbGetQuery(con, sqlQuery)")))  #Cette expression va créer un dataframe avec le nom de la table en exécutant la requête via la connection
			eval(parse(text=paste0("assign('", tbl, "',carFile,envir=parent.frame())")))	#http://stackoverflow.com/questions/13538628/returning-different-data-frames-in-a-function-r
			
		# Populer la table de synthèse
			# initialiser le data frame
			df <- data.frame(id = integer(), tablename = character(), rowProp = numeric(), random = logical(), query = character(), stringsAsFactors=FALSE)
			# assigner les valeurs
			df[i, 1] <- i			# id
			df[i, 2] <- tbl			# tablename
			df[i, 3] <- prop		# rowProp
			df[i, 4] <- rand		# random
			df[i, 5] <- sqlQuery	# query
		
		}
	
	# Fermer la connection à la base de données
	dbDisconnect(con)
	
	# Retourner le data frame synthèse
	return(df)
}