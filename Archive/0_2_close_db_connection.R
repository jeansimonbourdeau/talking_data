###Ce script permet de fermer la connection à la base de données sous postgreSQL###
#######
dbDisconnect(con)
# Detach Package
detach("package:RPostgreSQL", unload=TRUE)
##	Fin Import
#######