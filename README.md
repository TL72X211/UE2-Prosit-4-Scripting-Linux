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
  * Réviser Crontab
  * Etudier le bash (Synthaxe, interpréteur, librairies, typage langage, paradigme, fonctions ?, objets ?)
  
### Réalistions
* Installer puis configurer Apache
* Configurer le DNS
* Avoir deux sites disponibles sous Apache
* Créer deux scripts : 
	* Un pour sauvegarder les fichiers de configurations
	* Créer site

#### **I - Apache et Bind9**

**Apache** est un serveur HTTP, c'est le plus populaire sur le WWW.

* Installer le paquet _apache2_
* On configure les interfaces d'écoute (n° port)-> _/etc/apache2/ports.conf_
* On configure apache2 dans _/etc/apache2/apache2.conf_
	* https://doc.ubuntu-fr.org/apache2
* On configure les vhosts dans _/etc/apache2.sites-available_
	* Par défaut, il n'y a que le default.conf, il faut donc le modifier (son nom y compris)
	* Une fois modifié, on doit supprimer l'ancien lien symbolique grâce à _a2dissite default_
	* On active enfin le vhost, en créant le lien sympolique, ce qui va le passer dans le répertoire _/sites-enabled_ grâce à la commande  _a2ensite nomduvhost_
	* On modifie enfin, dans _/etc/_hosts_ la ligne, avec _127.0.0.1 localhost nomduvhost_ , pour permettre à notre machine locale de faire la correspondance entre le nom de l'hôte et notre machine locale.
* On pourra y activer bon nombre de sécurités (voir doc officielle)
	*  Sécurité des pages
	* Pare-Feu
	* .htacess (zone sécurisées)
* Pour le démarrer -> _service apache2 start_

**Bind9**	

* Installer le paquet _bind9_ et _dnsutils_ (pour tester et débuguer le service DNS)
* Les fichiers de configuration sont dans _/etc/bind_
	* named.conf
	* named.conf.options
	* named.conf.local
* En fonction de la configuration que l'on souhaite, il faut suivre le tutoriel suivant  : https://doc.ubuntu-fr.org/bind9

#### **II - Créer un script shell**

Un shell est un _**interpréteur de commandes**_ , c'est un programme spécial qui joue le rôle d'intermédiaire en interprétant des commandes rentrés par l'utilisateur.

**Comment faire un script en shell :**

* Ecrire un script (On utilise _nano_ ou _vi_ comme éditeurs de textes)
* Changer les permission de ce script ( tout pour le proprio, et le reste est en write and execute)
	* _chmod +x [nomscript]_
	*  _chmod 755 [nomscript]_
	* Pour exécuter un script _./nomscript_ ou _bash nomscript_ ou _sh nomscript_
* L'extension d'un script shell est .sh
* On marque _#!/bin/sh_ au début de notre script, c'est un 'shebang' pour définir quel interpréteur utiliser. (Ici, du sh, mais on aurait pu mettre du Python).
* On utilise des $, comme dans un script serveur, pour utiliser les différentes variables.

Un bel exemple au niveau des arguments : http://www.linux-france.org/article/memo/node83.html
Le système des **While**  : http://www.linux-france.org/article/memo/node84.html
A la différence des autres langages, on utilise while [cond] do [actions]  done pour en faire.
**esac** sert comme les fi (end if), mais pour les switch case.
Les **options** sur les vérifications : http://www.linux-france.org/article/memo/node86.html
Le **if** + Script sauvegarde : http://www.linux-france.org/article/memo/node87.html
{...} Sur ce site, on retrouvera ainsi comment faire une **fonction et autres**.

On retrouve aussi une **boucle "select"** (nouveauté)

C'est une structure de contrôle de type boucle qui permet d'afficher de manière cyclique un menu.
A chaque tour de boucle, on a ainsi la liste des items qui est affiché.

* PS3 => saisie du choix utilisateur. Sa valeur par défaut est #?
* REPLY contiendra l'indice de l'item sélectionné.

#### **III - Révisions de Crontab**
