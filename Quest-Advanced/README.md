# Ecole : __ETNA__ | Module : IDV-DFO5
___Leo Ressayre___
## _Concepts avancés en Haskell_


Voici mon projet IDV-DFO5 _Concepts avancés en Haskell_.
Vouc trouverez ici : 
 - Un dossier __day02__, contenant un fichier __MyPool.hs__
 - Un dossier __TestModule__, contenant un fichier __MyPool.hs__
 - Un fichier __main.hs__
 - Un fichier __Makefile__

## Résumé

Le dossier __day02__ et son contenu sont destinés à la validation par moulinette. Lors de la validation des différents modules, seul ce dossier était présent, dans le but de respecter les contraintes de l'énoncé, et d'assurer la validation par la moulinette.

Le dossier __TestModule__ et notamment le fichier __MyPool.hs__ contient les fonctions demandées pour chaque quest, mais a la particularité d'être un module. Ainsi, il est utilisable en dehors de ce fichier, et m'a permis de faciliter le test de mes fonctions.

Le fichier __main.hs__ importe le module TestModule.MyPool, et contient tout les tests de chacunes des fonctions des quests. J'y implémente aussi deux fonction pour la visualisation des tests (startTest et endTest).

Le fichier __Makefile__ est un simple fichier makefile permettant de compiler ensemble les modules de __TestModule__, et le fichier __main.hs__. Il implémente deux commandes : 
 - _make_: qui permet de compiler le projet, en créant l'exécutable cible __main__, que l'on peut appeler via la commande _./main_ si l'on se situe à la racine du projet
 - _make clean_: qui permet de supprimer tout les fichiers issus de la compilation (y compris le fichier cible main)



## Comment faire fonctionner le projet
### _Pré-requis_
A noter que les packages nécéssaires à la compilation en haskell sont nécéssaires.
Cf le [site officiel](https://www.haskell.org/ghcup/install/)

### _Utilisation_
Afin de faire fonctionner le projet, il suffit de récupérer le code source, et d'utiliser la commande _make_. Ceci va compiler les fichiers et créer un exécutable __main__, que vous pourrez exécuter via la commande _./main_.