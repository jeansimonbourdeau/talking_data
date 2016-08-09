# talking_data
Repository for the Kaggle challenge about Talking Data

Dans le repo, vous pouvez trouver le fichier 0_Run_Scripts qui sert de fhicier principal qui exécute tous les autres scripts. 

Afin que le tout fonctionne, vous devez créer un dossier "RScript" à l'intérieur du dossier où le projet R est situé. Le working directory devrait être fixé au dossier contenant le projet R. Pour vérifier où pointe votre working directory, utilisez la commande getwd(), pour modifier le working directory, utilisez la commande setwd().

Vous devez installer les packages nécessaires avant d'exécuter le tout avec la commande install.packages("packagename"). Si les packages ne sont pas disponibles sur le CRAN, mais bien sur un Github (comme le package xda), simplement aller sur la page Github et regarder les premières lignes des instructions pour la marche à suivre.

Voici les développements à faire:

- Améliorer l'interface/la façon dont R demande à l'usager de rentrer une valeur (ne pas utiliser tcltk).
- Pour les fichiers 0_3_import_xxx.R à 0_9_import_xxx.R : Rassembler le tout dans un fichier qui en boucle exécute le code pour les différentes tables.
- Créer une fonction qui se source d'une table pour aller faire exécuter le code d'importation avec des paramêtres individuels.
- Créer une fonction qui output dans une table les différentes séquence d'importation avec un timestamp pour s'y référencer par la suite.
- Pour les fichiers 1_3_clean_xxx.R à 1_8_clean_xxx.R: Valider les méthodes de nettoyage employées.
