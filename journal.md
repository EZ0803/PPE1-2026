# Journal de bord du projet encadré

## 30 septembre 2026 
### TP problèmes rencontrés 

J'ai essayé de lancer au début du TP, la commande wget, mais étant sur mac, le terminal n'a pas réussi à comprendre la commande. 
J'ai donc utilisé ce code pour l'installer :

 - brew install wget 

Ensuite j'ai réussi collé le lien vers mon fichier zip et à l'ouvrir grace à la commande unzip.

Parfois j'ai eu des erreurs dans mes comamndes à cause de l'oublie de *. Par exemple sur 

 - mv txt/2016_01 txt/2016/01


J'ai rencontré des erreurs suite à la création de dossiers en oubliant d'écrire le chemin à suivre, 
les dossiers étaient donc créés dans mon dossier courant.


Lorsque je déplacais les images dans le dossier img, j'ai dû écrire le nom de chaque extension car il n'y avait rien qui ne me 
permettait de les déplacer en une fois, contrairement aux .txt et .ann. 
Il y avait : .jpg | .JPEG | .png | .gif | .GIF | etc


### En parrallèle au TD


J'ai eu du mal à accéder à mon historique complet car j'avais oublié qu'on devait ajouter un nombre après history. 
Vers la fin du cours, je réussi à y accéder grace à :

 - history 0 


## Exercice Git Introduction

J'ai commencé par me connecter à mon compte Github, avant de créer un nouveau dépôt. 
Je n'ai rencontré aucun problème pour récuperer le dépôt sur mon terminal, avec git clone (url).
J'avais déjà commencé un journal lors du dernier cours, mais ne comprenant pas tout à fait ce qu'il fallait faire
et ayant peur de commettre des erreurs, j'ai décidé de créer le journal, puis ensuite de coller le contenu que j'avais 
écrit précédemment. 
Pour la modification de mon journal, je n'ai pas réussi à le faire au début, car je n'avais pas précisé qu'il fallait 
l'ouvrir avec un éditeur de texte sur le terminal. Par la suite j'ai utilisé l'éditeur de texte nano pour modifier le contenu du journal. 

## Exercice pipeline

Je cherche à obtenir le nombre de fichier contenu dans chaque dossier par année. Je vais donc aller rechercher le 
contenu des dossiers, puis ensuite je vais les compter. 
Pour commencer, je vais extraire les fichiers contenus dans les dossiers 2016 avec la commande grep. 
En recherchant les options proposés par grep avec le man, je constate qu'il y a l'option -r qui permet une lecture recursive, 
de plus il y a aussi l'option -l qui ne récupère que les nom des fichiers, sans pour autant les lire. 
Je rentre donc la commande suivante dans mon terminal : 
 - grep -r -l "" ann/2016
Le terminal m'affiche tous les fichiers contenu dans le dossier 2016 et dans chacune des dossiers 01,02,03, ... , 12. 

Je souhaite maintenant afficher le nombre de ligne de résultat. Je dois donc utiliser la commande wc avec l'option -l pour ne compter que les lignes. 

Je complète ma commande comme ci-dessous :
 - grep -r -l "" ann/2016 | wc -l
J'obtiens un résultat de 572 lignes. 

Je souhaite enregistrer le résutat dans Exercices/comptes.txt 
Selon l'exemple, le contenu du fichier comptes.txt doit être présenté tel que : 
Annotations en 2016 :
1234
Annotations en 2018 :
1234
Annotations en 2017 :
1234

Je crée donc le fichier en lui donnant pour contenu Annotations en 2016 

 - echo "Annotations en 2016 :" > ../PPE1-2026/Exercices/comptes.txt

Ensuite, je lui envoie les résultats :

 - grep -r -l "" ann/2016 | wc -l >> ../PPE1-2026/Exercices/comptes.txt

Ici je fais attention à bien mettre deux chevrons afin de ne pas écraser les données déjà existantes dans le fichier. 
Je vérifie le contenu du fichier :
 - cat ../PPE1-2026/Exercices/comptes.txt

Je fais donc la même chose pour les années 2017 et 2018. 

Pour la question 1.b), je crée le fichier locations.txt. Je ne cherche plus à avoir le nombre de fichier, mais à lire les fichiers pour trouver ceux avec "Location".
Je retire donc l'option -l qui me permetait de ne récupérer que le nom du fichier. 

 - grep -r "Location" ../../Exercice1/ann/2016 | wc -l

Le résultat affiché pour 2016 est de 3144. 
Je fais comme précédemment pour le nombre d'annotation, j'enregistre les résultats dans le fichier locations.txt.

 - echo "Locations en 2016" > locations.txt
 - grep -r "Location" ../../Exercice1/ann/2016 | wc -l >> locations.txt

Je vérifie que tout est bon avant de continuer 
 - cat locations.txt

Pour l'Exercice 2, je me souviens qu'avec cut, on pouvait choisir le numéro de colonne qu'on souhaitait afficher. 
Je lance donc la commande suivante : 

 - grep -r "Location" ../../Exercice1/ann/2016 | cut -f 3 

Je rajoute les commandes pour les trier dans l'ordre alphabétique, puis je compte le nombre d'occurence de chaque lieu. 
 - grep -r "Location" ../../Exercice1/ann/2016 | cut -f 3 | sort | uniq -c

Je retrie les éléments, cette fois selon leur nombre d'occurence, puis je ne garde que les 15 en partant de la fin. 

 - grep -r "Location" ../../Exercice1/ann/2016 | cut -f 3 | sort | uniq -c | sort | tail -n 15

J'enregistre le résultat dans le fichier demandé. 

grep -r "Location" ../../Exercice1/ann/2016 | cut -f 3 | sort | uniq -c | sort | tail -n 15 >> classement_2016.txt

Je fais la même chose pour les autres années. 

Pour la dernière partie des exercices, il me suffit de préciser le mois concerné et de citer tous les dossiers des années. 

 - grep -r "Location" ../../Exercice1/ann/2016/03 ../../Exercice1/ann/2017/03 ../../Exercice1/ann/2018/03| cut -f 3 | sort | uniq -c | sort | tail -n 15 

Le résultat affiché me semble correct, donc je l'envoie donc dans un nouveau fichier. 

J'ai rencontré des difficultés à comprendre le foctionnement des tags, mais en faisant quelques essaies, j'ai réussi à comprendre leur utilisation. 

