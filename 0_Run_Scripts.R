#Montrer le dossier où les scripts sont situés  
	scriptDirectory <- paste0(getwd(), "/RScript/")		#Vous devez mettre les scripts dans un dossier nommé RScript à l'intérieur de votre working directory

## DÉBUT IMPORTATION DES DONNÉES
	#Initialisation
		source(file = paste0(scriptDirectory, "0_0_initialize.R"))
		source(paste0(scriptDirectory, "varEntryDialog.R"))		#importer une fonction
	#Ouvrir une connection à la base de données
		source(file = paste0(scriptDirectory, "0_1_open_db_connection.R"))
			#Get specific table data
				source(file = paste0(scriptDirectory, "0_3_import_app_events.R"))
				source(file = paste0(scriptDirectory, "0_4_import_app_labels.R"))
				source(file = paste0(scriptDirectory, "0_5_import_events.R"))
				source(file = paste0(scriptDirectory, "0_6_import_label_categories.R"))
				source(file = paste0(scriptDirectory, "0_7_import_phone_brand_device_model.R"))
				source(file = paste0(scriptDirectory, "0_8_import_gender_age_train.R"))
				source(file = paste0(scriptDirectory, "0_9_import_gender_age_test.R"))
	#Fermer la connection à la base de données
		source(file = paste0(scriptDirectory, "0_2_close_db_connection.R"))
## FIN IMPORTATION DES DONNNÉES
## DÉBUT TRAITEMENT DES TABLES PRÉLIMINAIRE
		#Traitement spécifique
			source(file = paste0(scriptDirectory, "1_3_clean_app_events.R"))
			source(file = paste0(scriptDirectory, "1_4_clean_app_labels.R"))
			source(file = paste0(scriptDirectory, "1_5_clean_events.R"))
			source(file = paste0(scriptDirectory, "1_6_clean_label_categories.R"))
			source(file = paste0(scriptDirectory, "1_7_clean_phone_brand_device_model.R"))
			source(file = paste0(scriptDirectory, "1_8_clean_gender_age_train.R"))
## FIN TRAITEMENT DES TABLES PRÉLIMINAIRE