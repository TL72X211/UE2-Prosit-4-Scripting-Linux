#!/bin/bash
# on test si il y a  argument
if [ $# == 1 ]; then
	#on test si le domaine existe déjà
	if [ -f /var/www/$1.local.conf ]; then
		#Si il existe on quitte le script
		echo "$1.local exists"
		exit 2
	else
		#Si il n'existe pas on créé le répertoire et le .conf dans /var/www 
		echo "$1.local doesn't exist in /var/www/"
		touch /var/www/$1.local.conf
		mkdir /var/www/$1.local
		echo "created $1.local"
		#On va ajouter le virtual host
		echo "adding virtual host $1.local"
		printf "<VirtualHost *80>\n	DocumentRoot /var/www/$1.local/\n	ServeurName $1.local\n</VirtualHost>\n" > /etc/apache2/sites-available/$1.local.conf
		echo "virtual host added"
		#on ajoute l'enregistrement DNS
		echo "adding $1.local to hosts file"
		echo "127.0.0.1 $1.local" >> /etc/hosts
		#echo "" >> /etc/resolv.conf
		echo "added $1.local to hosts file"
		echo "enabling the site $1.local"
		a2ensite $1.local
		echo "$1.local enabled"
		/etc/init.d/apache2 restart
fi
else 

echo "wrong number of arguments" $#
fi
