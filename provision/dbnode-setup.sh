#!/bin/bash

# Variables
PGPASSWD=postgres
DBNAME=db
DBUSER=django
DBPASSWD=django
PG_VERSION=9.3

echo "-------------------------------------------------------------------------"
echo "--> Provisioning VM"
echo "--> apt-get updating"
sudo apt-get -y update > /dev/null

echo "--> Installing PostgreSQL"
sudo apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION" > /dev/null

echo "--> Configuring PostgreSQL"
PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"
# Edit postgresql.conf to change listen address to '*':
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"
# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"
# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"
# Restart so that all new config is loaded:
sudo service postgresql restart > /dev/null

echo "--> Creating database user and database"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$PGPASSWD'" > /dev/null
sudo -u postgres psql -c "CREATE USER $DBUSER WITH PASSWORD '$DBPASSWD' CREATEDB" > /dev/null
sudo -u postgres psql -c "CREATE DATABASE $DBNAME ENCODING = 'UTF-8' LC_CTYPE = 'en_US.UTF-8' LC_COLLATE = 'en_US.UTF-8' OWNER $DBUSER TEMPLATE template0" > /dev/null

echo "--> VM provisioned"
echo "-------------------------------------------------------------------------"
echo "--> Go build stuff!"
echo "-------------------------------------------------------------------------"
