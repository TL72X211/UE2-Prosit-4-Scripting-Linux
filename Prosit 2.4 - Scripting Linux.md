*Prosit 2.4 - Scripting Linux*

# Mots Clés

- /var/www :
- Fichier de configuration :
- DNS :
- Automatiser le processus :
- Bind9 :
- Apache 2:
- Sauvegarde :
- Commande ls :
- Commande cd :
- Création d'un nouveau sous domaine :
- Hôte Virtuel :
- Terminal Linux :
- Commande peut-être lancée depuis n'importe où :
- Chemin Relatif :
- Chemin Absolu :
- Nom de domaine :

# Problématique

- *Comment créer un script de sauvegarde et d'ajout de domaine sous Linux.*

# Hypothèses

- On doit placer le script dans le /bin pour pouvoir le lancer depuis n'importe où
- ls et cd sont des commandes systèmes qui permettent de se déplacer dans l'architecture Linux
- On peut utiliser Cron pour automatiser les scripts
- Pour pouvoir coder en bash (script) -> #!/bind/bash
- lancer script -> .nomScript
- Bind9 est un serveurDNS
- Pour save on a besoin d'autorisations spécifiques
- ScriptExtention => .sh

# Plan D'action
### Études
- Réviser Apache et Bind9
- Comment créer un script
- Réviser Crontab
- Etudier le bash (Synthaxe, interpréteur, librairies, typage langage, paradigme, fonctions ?, objets ?)

### Réalistions
- Installer puis configurer Apache
- Configurer le DNS
- Avoir deux sites disponibles sous Apache
- Créer deux scripts :
- Un pour sauvegarder les fichiers de configurations
- Créer site

# Etudes

### Apache et Bind9

[...]

### Les Scripts

Un script est un programme informatique développé pour fonctionner dans un interpréteur de commandes (Il ne sont donc pas compilés).
Il existe plusieurs langages de script :
- Shell Script
- Bash
- csh
- [...]

Avantages
- Syntaxe identique aux lignes de commandes,
- Coder un script est plus rapide que de coder un programmes aux fonctionnalitées identiques (En général),
- Un script ne doit pas etre compilé avant d'être excexuté,

Désaventages
- Vitesse d'execution : lente.

### Crontab (Révision)

Crontab est un outil permettant de planifier des commandes a executer périodiquement.
- *crontab -l* : permet de visualiser les différents cronjobs.
- *crontab -e* : permet de modifier les cronjobs.
- Les cronjobs sont écrit de la manière suivante : `* * * * * /bin/execute/this/script.sh`

Explication de la planification
- 5 parties
    - Minute (from 0 to 59)
    - Hour (from 0 to 23)
    - Day of month (from 1 to 31)
    - Month (from 1 to 12)
    - Day of week (from 0 to 6) (0=Sunday)
- '\*' = "Every"
- Keywords :
    - @reboot     Run once, at startup
    - @yearly     Run once  a year     `0 0 1 1 *`
    - @annually   (same as  @yearly)
    - @monthly    Run once  a month    `0 0 1 * *`
    - @weekly     Run once  a week     `0 0 * * 0`
    - @daily      Run once  a day      `0 0 * * *`
    - @midnight   (same as  @daily)
    - @hourly     Run once  an hour    `0 * * * *`
- Ex : "`* * * * * /bin/execute/this/script.sh`" = "Every minutes of every hour of every day of month of every month of every day of week."

### Bash

Bash est un langage de commandes, [...]
