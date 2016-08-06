###Ce script permet de se connecter à la base de données sous postgresSQL###
#######
#Créer une connection pour aller chercher les tables
#install.packages("RPostgreSQL")	# Pour installer le package, l'exécuter qu'une seule fois
require(RPostgreSQL)				#activer le package nécessaire

# Establish connection to PoststgreSQL using RPostgreSQL
drv <- dbDriver("PostgreSQL")
# Full version of connection setting
con <- dbConnect(drv, dbname="workshops",host="amazondwh.cklirxf6ilib.us-east-1.rds.amazonaws.com",port=5432,user="jeansimon",password="INSCRIRE_LE_MOT_DE_PASSE_ICI" )

#Requete
sqlQuery <- "SELECT * FROM \"label_categories\" ;" 		# inscrire la requête ici

# sends the command and creates the table
df <- dbGetQuery(con, sqlQuery)
# Close PostgreSQL connection 
dbDisconnect(con)
# Detach Package
detach("package:RPostgreSQL", unload=TRUE)
##	Fin Import
#######