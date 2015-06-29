#!/bin/bash

# Variables
PGPASSWD=postgres
DBNAME=lld_db
DBUSER=django
DBPASSWD=django
PG_VERSION=9.3
PHPPG_USER=vagrant
PHPPG_PASSWD=vagrant

echo " "
echo "---{ Provisioning VM..."
echo " "

echo " "
echo "---{ Updating..."
echo " "
sudo apt-get -y update > /dev/null

echo " "
echo "---{ Installing PostgreSQL & phpPgAdmin..."
echo " "
sudo apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION" phppgadmin > /dev/null
sudo apt-get install apache2-utils > /dev/null

echo " "
echo "---{ Configuring PostgreSQL..."
echo " "
PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"
# Edit postgresql.conf to change listen address to '*':
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"
# Append to pg_hba.conf to add password auth:
echo "host     all             all             all                     md5" >> "$PG_HBA"
# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"
# Restart so that all new config is loaded:
sudo service postgresql restart > /dev/null

echo " "
echo "---{ Create DB user and database..."
echo " "
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$PGPASSWD'" > /dev/null
sudo -u postgres psql -c "CREATE USER $DBUSER WITH PASSWORD '$DBPASSWD' CREATEDB" > /dev/null
sudo -u postgres psql -c "CREATE DATABASE $DBNAME ENCODING = 'UTF-8' LC_CTYPE = 'en_US.UTF-8' LC_COLLATE = 'en_US.UTF-8' OWNER $DBUSER TEMPLATE template0" > /dev/null

echo " "
echo "---{ Configuring phpPgAdmin..."
echo " "
# make phppgadmin page available to all visitors
sudo sed -i 's/# allow from all/allow from all/' /etc/apache2/conf.d/phppgadmin
# set up user authorization in default site
sudo chown vagrant /etc/apache2/sites-available/000-default.conf
sudo echo -e '\n\n<Directory "/usr/share/phppgadmin">\n\tAuthUserFile /etc/phppgadmin/.htpasswd\n\tAuthName "Restricted Area"\n\tAuthType Basic\n\trequire valid-user\n</Directory>' >> /etc/apache2/sites-available/000-default.conf
# create phpPgAdmin user information
echo "$PHPPG_PASSWD" | sudo htpasswd -i -c /etc/phppgadmin/.htpasswd $PHPPG_USER > /dev/null
# TODO find where line 60 originated from
sudo chown vagrant /etc/apache2/apache2.conf
sudo echo -e "\nInclude /etc/apache2/conf.d/phppgadmin" >> /etc/apache2/apache2.conf

sudo service apache2 restart > /dev/null

echo " "
echo "---{ VM provisioned."
echo " "
