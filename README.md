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
The for loop is a little bit different from other programming languages. Basically, it let's you iterate over a series of 'words' within a string.
The while executes a piece of code if the control expression is true, and only stops when it is false (or a explicit break is found within the executed code.
The until loop is almost equal to the while loop, except that the code is executed while the control expression evaluates to false.


* while : 	
Permet entre autre de tester les arguments passés au programme et les traiter, elle sera donc au début de script

While [ <condition>]
do
	opérations
done

For <variable> in <variable>
Do
	Operations
Done

Until [<condition]
Do
	Operations
Done


Fonctions :
Function nomFonction {
	opérations
}
Fonction avec paramètres :

Function nomFonction {
	Echo $1
}
Va afficher le premier paramètre qu’on passe à la fonction
Pour appeller une function on utilise son nom



Commandes : 
Help affiche la liste des commandes internet du shell

  * Réviser Crontab
  * Etudier le bash (Synthaxe, interpréteur, librairies, typage langage, paradigme, fonctions ?, objets ?)
  
### Réalistions
* Installer puis configurer Apache
Un s’assure d’abord d’avoir sa machine à jour
apt-get update
on intalle apache2, la doc et les utilitées
apt-get install apache2 apache2-doc apache2-utils

on désactive KeepAlive dans le fichier de congif principal
nano /etc/apache2/apache2.conf
on cherche KeepAlive (vers le milieu du fichier) et on le passe de on à off

Configurer les virtual host :
 On désactive celui par défaut
a2dissite 000-default.conf
il nous dit « Site 000-default disabled.
To activate the new configuration, you need to run:
  service apache2 reload »
créé un virtual host : 
on créé <nomdesite<.conf dans /etc/apache2/sites-available  par exemple exemple.com.conf
<VirtualHost *:80>
     ServerAdmin webmaster@example.com
     ServerName example.com
     ServerAlias www.example.com
     DocumentRoot /var/www/example.com/public_html/
     ErrorLog /var/www/example.com/logs/error.log
     CustomLog /var/www/example.com/logs/access.log combined
</VirtualHost>

On  créé le répertoire pour lesite et les logs
sudo mkdir -p /var/www/example.com/public_html
sudo mkdir /var/www/example.com/logs

on active le site 
sudo a2ensite example.com.conf

on redémare apache:
sudo systemctl restart apache2


* Configurer le DNS

* Avoir deux sites disponibles sous Apache
* Créer deux scripts : 
	* Un pour sauvegarder les fichiers de configurations
	* Créer site



