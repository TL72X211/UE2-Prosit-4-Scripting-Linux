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

	
	..JE SUIS UN TEST POUR GITKRAKEN


