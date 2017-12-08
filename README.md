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

	




