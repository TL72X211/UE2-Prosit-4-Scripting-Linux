
Scripting Linux
Team

    Animateur : Florian [FloFlo]
    Secrétaire : Hugo [Yugo]
    Scribe : Emilien [Emilio]
    Gestionnaire : Maxime [Vibrophone]

Mots Clés

    /var/www :
    Fichier de configuration :
    DNS :
    Automatiser le processus :
    Bind9 :
    Apache 2:
    Sauvegarde :
    commande ls :
    commande cd :
    Création d'un nouveau sous domaine :
    Hôte Virtuel :
    Terminal Linux :
    Commande peut-être lancée depuis n'importe où :
    Chemin Relatif :
    Chemin Absolu :
    Nom de domaine :

Contexte
Quoi ?

    Sauvegarder régulièrement les fichiers de configurations
    Ajouter un sous domaine rapidement

Comment ?

    Automatiser avec un script que l'on crée

Pourquoi ?

    Pour pouvoir restaurer le serveur
    Gagner du temps de restauration

Contraintes

    Linux
    Respecter la syntaxe
    Lançable depuis n'importe où
    Emplacement de sauvegarde

Problématique

    Comment créer un script de sauvegarde et d'ajout de domaine sous Linux.

Généralisation

    Automatisation
    MCO (Maintenance Conditions Opérationnelles)

Hypothèses

    On doit placer le script dans le /bin pour pouvoir le lancer depuis n'importe où
    ls et cd sont des commandes systèmes qui permettent de se déplacer dans l'architecture Linux
    On peut utiliser Cron pour automatiser les scripts
    Pour pouvoir coder en bash (script) -> #!/bind/bash
    lancer script -> .nomScript
    Bind9 est un serveurDNS
    Pour save on a besoin d'autorisations spécifiques
    ScriptExtention => .sh

Plan d'action
Études

- Réviser Apache et Bind9 :
	- Apache est serveur HTTP. Tout d'abord il faut configurer les ports d'écoute d'apache en faisant "nano /etc/apache2/ports.conf" ensuite il faut configurer apache2 avec "nano /etc/apache2/apache2.conf". Il nous faut aussi configurer les virtual hosts avec dans /etc/apache2.sites-available. Puis nous devons activé les sécurités liés à Apache. Enfin pour le démarrer il suffit de faire "service apache 2 start".
	- Bind9 est un serveur DNS. Tout d'abord il faut installer les paquets bind9 et dnsutils afin de tester et débuguer le service DNS. Ensuite, nous pouvons le configurer dans les fichiers (named.conf, named.conf.options et named.conf.local) situé dans /etc/bind.
- Comment créer un script :
	- Pour créer un script, nous devons utiliser un interpréteur de commande, le shell. Il existe plusieurs shells, nous pouvons voir la liste dans "/etc/shells". Les plus connues sont le bash (Bourne Again Shell), le ksh (Korn shell) et le tcsh (Tenex C shell). Dans Linux, le bash est installé par défaut, il est le plus puissant et le plus utilisé.
		L'initialisation d'un script se fais grâce à plusieurs scripts nous permettant de le personnaliser. Les fichiers lus et exécutés sont :
	- /etc/profile s’il existe
	- $HOME/.bash_profile s’il existe
	- Sinon $HOME/.bash_login s’il existe
	- "$HOME/.profile s’il existe" si "$HOME/.bash_profile" n’existe pas
	- Le fichier système /etc/bashrc
	- Le fichier de ressources .bashrc s’il existe, sauf si $HOME/.profile est pris en compte auquel cas .bashrc n’est pas pris en compte même s’il existe
	- Si bash est utilisé en tant que shell il n’exécute que les fichiers /etc/profile et $HOME/.profile s’ils existent.
	- Pour personnaliser le shell bash on doit modifier "$HOME/.bash_profile" et/ou "$HOME/.bashrc".
Les scripts sont des fichiers exécutables permettant de lancer plusieurs commande.

- Réviser Crontab :
	- 
- Etudier le bash (Syntaxe, interpréteur, librairies, typage langage, paradigme, fonctions ?, objets ?) :
	* Syntaxe : 
		* les métacaractères du shell : caractère possédant une signification autre que la littérale ( "*" ne représente pas le caractère étoile pour le bash, il le lit comme représentant n'importe quelle suite de caractère ou une absence). Ils se divisent en deux classes : ceux de substitution et ceux de protection des caractères.
			* Métacaratères de substitution :
					1. "*" ne correspond à aucun caractère, n'importe quel caractère ou ensemble de caractères ;
					2. "?" correspond à un caractère quelconque ;
			* Métacarctères de protection :
					1. "\" empêche l'interprétation spéciale d'un métacaractère ;
					2. l'apostrophe inversée provoquent un interprétation de la chaîne de caractères incluse entre deux de ces caractères comme une commande.
					3. "'" tous les caractères inclus entre deux caractères sont interprétés comme du texte.
		* le caractère d’échappement "\" : 
			* En fin de ligne : indique que la commande continue à la ligne suivante.
			* Pour former un des caractères spéciaux du C : 
			* Avant un méta-caractère de bash : les méta-caractères tel que "*" ne sont pas interprétés par bash en tant que littéraux tel que les commandes find et sed. Exemple : pour trouver les fichier commencant par my il faut utiliser "find . -name my\*".
		* Gestion de processus :
		* Gestion de flux : chaque commande est associée à trois flux : l'entrée standard, la sortie standard et la sortie d'erreur standard. Ci dessous les méthode d'utilisation :
		* Variable du shell : les variables sont référencées en faisant précéder $ de la variable désirée.
		* Substitution de commande : on peut remplacer, dans une ligne de commande, un argument par son résultat en l'entourant de "`" ou en utilisant $().
		* Raccourcis clavier en Emacs : 
		* Raccourcis en vi :
	
Réalistions

- Installer puis configurer Apache
- Configurer le DNS
- Avoir deux sites disponibles sous Apache
- Créer deux scripts :
	- Un pour sauvegarder les fichiers de configurations
	- Créer site
