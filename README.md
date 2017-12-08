**Scripting Linux**
--------------------------
## Team
   * Animateur : **Florian [FloFlo]**
   * Secrétaire : **Hugo [Yugo]**
   * Scribe : **Emilien [Emilio]**
   * Gestionnaire : **Maxime [Vibrophone]**

## Mots Clés
   * /var/www : 
   * Fichier de configuration : 
   * DNS : 
   * Automatiser le processus : 
   * Bind9 :
   * Apache 2: 
   * Sauvegarde :
   * commande ls :
   * commande cd :
   * Création d'un nouveau sous domaine :
   * Hôte Virtuel : 
   * Terminal Linux : 
   * Commande peut-être lancée depuis n'importe où : 
   * Chemin Relatif :
   * Chemin Absolu :
   * Nom de domaine :

## Contexte

### Quoi ?
 * Sauvegarder régulièrement les fichiers de configurations
 * Ajouter un sous domaine rapidement
  
### Comment ?
  * Automatiser avec un script que l'on crée
  
### Pourquoi ?
* Pour pouvoir restaurer le serveur
* Gagner du temps de restauration

## Contraintes
   * Linux
   * Respecter la syntaxe
   * Lançable depuis n'importe où
   * Emplacement de sauvegarde 
## Problématique
   *  Comment créer un script de sauvegarde et d'ajout de domaine sous Linux.

## Généralisation
   * Automatisation
   * MCO (Maintenance Conditions Opérationnelles)

## Hypothèses
 * On doit placer le script dans le /bin pour pouvoir le lancer depuis n'importe où
 * ls et cd sont des commandes systèmes qui permettent de se déplacer dans l'architecture Linux
 * On peut utiliser Cron pour automatiser les scripts
 * Pour pouvoir coder en bash (script) -> #!/bind/bash
 * lancer script -> .nomScript
 * Bind9 est un serveurDNS
 * Pour save on a besoin d'autorisations spécifiques
 * ScriptExtention => .sh
   
## Plan d'action

### Études
  * Réviser Apache et Bind9

  * Comment créer un script

Shell : interpréteur de commande, il existe plusieurs types de shells, on peut voir la liste des shells disponibles dans /etc/shells

* /bin/ash
* /bin/bash
* /bin/bash1
* /bin/csh
* /bin/false
* /bin/passwd
* /bin/sh
* /bin/tcsh
* /usr/bin/csh
* /usr/bin/ksh
* /usr/bin/tcsh
* /usr/bin/zsh

Les plus connus sont : bash (shell Bourne amélioré), ksh (shell Korn amélioré) et tcsh (shell C amélioré). Par défaut le shell bash est installé avec Linux, c’est le plus puissant (fonctionnalités ? rapidité ?) et le plus utilisé

Son initialisation se fait à l’aide de plusieurs scripts nous permettant donc de le personnaliser, dans l’ordre els fichiers lus et exécutés sont :

* /etc/profile s’il existe
* \$HOME/.bash_profile s’il existe
* Sinon \$HOME/.bash_login s’il existe
* \$HOME/.profile s’il existe et que \$HOME/.bash_profile n’existe pas
* Le fichier système /etc/bashrc 
* Le fichier de ressources .bashrc s’il existe, sauf si \$HOME/.profile est pris en compte auquel cas .bashrc n’est pas pris en compte même s’il existe
* Si bash est invoqué en tant que shell il n’exécute que les fichiers /etc/profile et \$HOME/.profile s’ils existent.
* Pour personnaliser le shell bash on doit modifier \$HOME/.bash_profile et/ou \$HOME/.bashrc.

Les scripts shells sont des fichiers exécutables permettant de lancer plusieurs commandes successivement.

**Création d’un script shell :**
Un script shell est un fichier dans lequel on entre les commandes, puis qu’on rend exécutable avec une commande comme chmod
Note : il faut vérifier que le répertoire dans lequel se trouve le script shell est contenu dans la variable d’environnement $PATH

Un script peut appeler un autre script y compris lui-même, on passe alors en sous-shell ($SHLVL)

**Interaction avec le script (arguments, entrées clavier) : **

* Récupérer les arguments
 * nom du script : $0
 * argument 1 : $1
 * argument 2 : $2
 * tous les arguments : $*
 * tous les arguments sous forme separé : $@
 * nombre d’aguments $# 

* Récupérer une entrée clavier :

 * Read entree1 entree2
Va demander 2 entrées clavier et les placer dans les variables \$entree1 et \$entree2
* Longueur du texte ${#moi}

* Dernière commande exécutée par le shell : $?
* PID du shell $$
* PID de la dernière commande exécutée en tâche de fond : $ !
* Pour terminer le script : exit <valeur> , cette valeur sera stockée dans $ ? à la fin de l’exécution du script, par convention on retourne 0 si tout se passe bien et 1 si il y a eu une erreur

**conditions itératives**

* while : 


Commandes : 
Help affiche la liste des commandes internet du shell

  * Réviser Crontab
  * Etudier le bash (Synthaxe, interpréteur, librairies, typage langage, paradigme, fonctions ?, objets ?)
  
### Réalistions
* Installer puis configurer Apache
* Configurer le DNS
* Avoir deux sites disponibles sous Apache
* Créer deux scripts : 
	* Un pour sauvegarder les fichiers de configurations
	* Créer site



