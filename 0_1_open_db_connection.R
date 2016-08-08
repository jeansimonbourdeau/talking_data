###Ce script permet de se connecter à la base de données sous postgresSQL###
#######
#Créer une connection pour aller chercher les tables
#install.packages("RPostgreSQL")	# Pour installer le package, l'exécuter qu'une seule fois
require(RPostgreSQL)				#activer le package nécessaire

passwordInput <- as.character(varEntryDialog(vars=c('Var1'), labels=c('Entrez le mot de passe de la base de données:')))

# Establish connection to PoststgreSQL using RPostgreSQL
drv <- dbDriver("PostgreSQL")
# Full version of connection setting
con <- dbConnect(drv, dbname="workshops",host="amazondwh.cklirxf6ilib.us-east-1.rds.amazonaws.com",port=5432,user="jeansimon",password=passwordInput)