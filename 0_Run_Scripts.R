#Montrer le dossier où les scripts sont situés  
	scriptDirectory <- paste0(getwd(), "/RScript/")		#Vous devez mettre les scripts dans un dossier nommé RScript à l'intérieur de votre working directory

## DÉBUT IMPORTATION DES DONNÉES
	#Initialisation
		source(file = paste0(scriptDirectory, "0_0_initialize.R"))
		source(paste0(scriptDirectory, "custom_functions.R"))		# importer des fonctions custom
		source(file = paste0(scriptDirectory, "0_3_import_table_data.R"))	# Rouler l'import

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