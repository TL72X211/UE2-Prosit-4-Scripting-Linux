#!/bin/bash

echo " Ce script va vous permettre de créer un site web sur apache2 "
echo " Pour commencer veillez donner le nom du site web sans les www "
read -p " Entrez votre le nom du site : " web

if [ -n $web ] && [ 'nslookup www.$web | grep "SERVFAIL" ' == 1 ] && [ -d "/var/www/$web/" ]
then

	echo " Création des fichiers pour le site web $web ... "

	echo " Création du repertoire $web dans /var/www/vhosts..."
	mkdir /var/www/$web
	echo " OK "

	echo "Changement des droits du fichier ..."
	chown -R septime:www-data /var/www/$web
	chmod -R 770 /var/www/$web
	echo "OK"

	echo "Ecriture du fichier de configuration dans /etc/apache2/sites-available/ ..."
	touch  /etc/apache2/sites-available/$web.conf
	echo "<VirtualHost *:80>
        	ServerName $web
        	ServerAlias www.$web
        	ServerAdmin webmaster@localhost
        	DocumentRoot /var/www/$web/public_html
        	DirectoryIndex index.php index.php index.html

	        <Directory /var/www/$web/public_html>
        	        Require all granted
                	AllowOverride All
        	</Directory>
	</VirtualHost>" > /etc/apache2/sites-available/$web.conf
	echo "OK"


	echo " Création du dossier public_html ... "
	mkdir /var/www/$web/public_html/
	echo "OK"

	echo "Création de l'index.html ..."
	touch /var/www/$web/public_html/index.html
	echo "<html>
        	<body>
        	<h1>Bravo !</h1>
                	<p>La mise en place d'un Virtualhost est réussie !</p>
        	</body>
	</html>" > /var/www/$web/public_html/index.html
	echo "Ok"

	echo "Création du phpinfo.php ..."
	touch /var/www/$web/public_html/phpinfo.php
	echo " <?php phpinfo(); ?> " > /var/www/$web/public_html/phpinfo.php
	echo "OK"

	echo "Activation du Vhosts ..."
	a2ensite $web
	echo "Ok"

	echo "Relancement d'apache 2 ..."
	/etc/init.d/apache2 restart
	echo "Ok"

	echo "Ajout du Vhosts sur le /etc/hosts"
	echo "127.0.0.1 $web www.$web " > /etc/hosts
	echo "OK"

	echo " "
	echo " "
	echo "Fin de la création de tous les fichiers. Veuillez vérifier que tout est correctement configuré et installé "
	exit 0

else
       	echo" Le script a rencontré une erreur lors de la création du VHost "
       	exit 1
fi

