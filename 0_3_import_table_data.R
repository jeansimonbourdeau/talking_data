tablename <- c("app_events", "app_labels", "events", "gender_age_test", "gender_age_train", "label_categories", "phone_brand_device_model")	# Inscrire les tables dont vous voulez importer les données
random <- c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)		# Recherche random ou pas
rowProp <- c(0.01, 1.00, 0.10, 1.00, 1.00, 1.00, 1.00)				# Proportion des données à aller chercher dans le range [0, 1]

# Fonction à exécuter pour récupérer les tables spécifiés dans les vecteurs plus haut
importSummary <- importPostgreSQLTable("workshops", "amazondwh.cklirxf6ilib.us-east-1.rds.amazonaws.com", 5432, "jeansimon", readLines("RScript\\db.txt"), tablename, rowProp, random)