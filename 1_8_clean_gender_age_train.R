###Ce script effectue le nettoyage préliminaire d'une table spécifique###
#######
options("scipen"=100, "digits"=3)	#Pour travailler avec des décimales au lieu de la notation scientifique

## Exploration générale
	#Structure de la table
		str(gender_age_train)
	#Premières 5 lignes
		head(gender_age_train)
	#Description des variables numériques
		numSummary(gender_age_train)
	#Description des variables textuelles/factorielles
		charSummary(gender_age_train)

## Exploration/traitement spécifique
#device_id 
	#unique?
		nrow(gender_age_train) == length(unique(gender_age_train$device_id))
	#Distribution des device_id
		ggplot(gender_age_train, aes(x=device_id)) + geom_density() #Ils ont été normalisés d'où les négatifs et les grands nombres
#age
	#Distribution des age
		gender_age_train %>% group_by(age) %>% summarise(n=length(age)) %>% mutate(N = n/sum(n)*100) %>% print(n=100)
		ggplot(gender_age_train, aes(x=age)) + geom_density()	
		ggplot(gender_age_train, aes(x=age)) + geom_histogram(binwidth=1)	#Démographie assez jeune	#Regarder (décider) pour couper les observations où les personnes sont trop jeunes/vieilles --> dans les insctructions ils disent de prendre les valeurs comme des vraies valeurs
#gender
	#Distribution des genres
		gender_age_train %>% group_by(gender) %>% summarise(n=length(age)) %>% mutate(N = n/sum(n)*100) %>% print(n=10)
		ggplot(gender_age_train, aes(x=gender)) + geom_bar()	#Presque deux fois plus d'hommes que de femmes
	#Transformer la variable en facteur
		gender_age_train$gender <- factor(x = gender_age_train$gender, levels = c("F", "M"))
#age_group	
	#Distribution des genres/age
		ggplot(gender_age_train, aes(x=age_group)) + geom_bar()	#
	#Transformer la variable en facteur
		gender_age_train$age_group <- factor(x = gender_age_train$age_group)
#######