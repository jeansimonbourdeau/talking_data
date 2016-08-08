###Ce script prend pour acquis qu'une connection à la base de données est ouverte et va récupérer les données###
#######
tablename <- "\"gender_age_test\""   #Assigner le nom de la table à être extraite

rowProp <- 1  #Réassignation des variables
random <- 1   #Réassignation des variables

#Requete pour déterminer le nombre de records dans la table
sqlQuery <- paste0("SELECT count(*) FROM ", tablename, " ;") 
# sends the command
rowCount <- dbGetQuery(con, sqlQuery)
rowCount <- as.numeric(rowCount[1,1])	#Trouver une façon alternative via le connecteur de la base de données pour trouver le nombre de records dans une table

#Ask the user some info to extract the data
rowProp <- as.numeric(varEntryDialog(vars=c('Var1'), labels=c(paste0("Le nb de lignes de la table ", tablename, " est de : ", rowCount, ". Quelle proportion des données voulez-vous extraire? 0-100"))))/100
random <- if(rowProp != 1) {as.numeric(varEntryDialog(vars=c('Var1'), labels=c(paste0("Voulez-vous que ce soit une recherche séquentielle (1) ou aléatoire (2)?"))))} else {1}
random <- ifelse(random == 2, TRUE, FALSE)	#Rafiner la gestion d'erreur dans cette partie de code

#Requete principale
if(random == TRUE){
sqlQuery <- paste0("SELECT * FROM ", tablename, " ORDER BY RANDOM() LIMIT ", ceiling(rowProp*rowCount), " ;")
} else {
sqlQuery <- paste0("SELECT * FROM ", tablename, ifelse(rowProp == 100, " ;", paste0(" LIMIT ", ceiling(rowProp*rowCount), " ;")))
}
# sends the command and creates the table
eval(parse(text=paste0(tablename, " <- dbGetQuery(con, sqlQuery)")))  #Cette expression va créer un dataframe avec le nom de la table en exécutant la requête via la connection

##	Fin Import
#######