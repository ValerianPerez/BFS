Auteurs : Chems Edine Himeur, Valérian Perez, Valentin Tran et Qi Zhao.


## Introduction

_Magic : the Gathering_ est le jeu de carte à collectionner le plus réputé au monde, fort de 25 ans d'existence, de plus de 20000 cartes uniques et de dizaines de millions de joueurs au travers du monde, il manque pourtant d'outils permettant de classifier fiablement et rapidement des centaines de cartes à des fin de collection ou de vente. C'est sur ce créneaux que BFS intervient. Il permet de reconnaitre une carte et d'en extraire les informations pertinentes avec une simple image. Ce n'est qu'un prototype, un _Proof of Concept_, permettant de mesurer la viabilité d'un tel procédé.

Ce programme tournant sous Octave permet d'extraire le nom d'une carte _Magic : The Gathering_ à partir d'une photo prise par un téléphone et d'interroger une base de donnée distante pour connaitre les détails la concernant. Ce projet intervient dans le cadre du projet de fin d'année du Master 2 d'Informatique Graphique et Analyse d'Image de l'Université Paul Sabatier, promotion 2018/2019.

## Présentation & Utilisation

Nous avons construit le programme afin qu’il soit simple à utiliser grâce à son interface facile d'accès. 

![IHM](/website_ressources/IHM.jpg)

Voici la description des zones :
1. Cette zone affiche la carte à analyser
1. Cette zone affichera la zone de titre détectée
1. Cette zone affichera le résultat de l'OCR
1. Cette zone affichera le résultat du reqêtage de la BDD
1. Ce bouton sert à charger une image
1. Ce bouton sert à lancer le traitement de l'image

La démarche à suivre est la suivante : l'utilisateur clique sur _OPEN IMAGE_, choisit l'image qu'il souhaite traiter, puis clique sur _Process_ et la magie opère ! Tout le traitement s'effectue de façon autonome et les résultats s'affichent à la fin dans les zones dédiées.

## Résultats
Les essaies suivants donnent un très bon résultat de détection et de reconnaissance de caractère. Toutefois la liaison avec la base de données, ne pouvait se faire dans l'environnement de test, d'où l'absence de resultat dans la zone 4. Ici nous utilisons l'API mise à disposition par le site _scryfall.com_.
![RageDeSarkhan](/website_ressources/rage.JPG)
![AvaleurDeVastebois](/website_ressources/avaleur.JPG)

## Axe de réflexion

Les résultats sont bons, mais sont relativement lents. L'implémentation dans un langage non natif en est la cause.
Pour améliorer les performances de la solution, une traduction en Python ou en C++ serait bénéfique.
Ensuite, la quantité de prétraitement est trop grande par rapport aux prises de vue, réfléchir à partir de ce constat pour les réarranger serait aussi une bonne piste d'amélioration.
En dernier recours, une utilisation plus contrainte serait envisageable pour avoir un environnement plus contrôlé et s'abstraire de certains prétraitement.
