#!/bin/bash

sudo apt-get install apache2

sudo apt-get install php

sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt-get install php7.0 php5.6 php5.6-mysql php-gettext php5.6-mbstring php-mbstring php7.0-mbstring php-xdebug libapache2-mod-php5.6 libapache2-mod-php7.0

sudo apt-get install mysql-server

cd /var/www/html

sudo apt-get install git

sudo git clone https://github.com/ethicalhack3r/DVWA.git

cd DVWA/config

sudo mv config.inc.php.dist config.inc.php

sudo service apache2 restart

sudo apt-get install libapache2-mod-security2 libapache2-modsecurity libapache2-mod-evasive

sudo mv /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

sudo service apache2 reload

sudo sed -i "s/SecRuleEngine DetectionOnly/SecRuleEngine On/" /etc/modsecurity/modsecurity.conf

sudo sed -i "s/SecResponseBodyAccess On/SecResponseBodyAccess Off/" /etc/modsecurity/modsecurity.conf

cd /usr/share/modsecurity-crs/activated_rules/

sudo ln -s ../base_rules/* .

sudo rm /etc/apache2/mods-enabled/security2.conf

sudo chmod 777 /etc/apache2/mods-enabled

cd /etc/apache2/mods-enabled/



sudo echo "



<IfModule security2_module>

# Default Debian dir for modsecurity's persistent data

SecDataDir /var/cache/modsecurity



# Include all the *.conf files in /etc/modsecurity.

# Keeping your local configuration in that directory

# will allow for an easy upgrade of THIS file and

# make your life easier

    IncludeOptional /etc/modsecurity/*.conf

IncludeOptional "/usr/share/modsecurity-crs/*.conf"

    IncludeOptional "/usr/share/modsecurity-crs/activated_rules/*.conf"



</IfModule>" >> security2.conf

sudo service apache2 reload

// Change the DVWA database Configuration settings