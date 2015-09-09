#!/bin/bash

echo "-------------------------------------------------------------------------"
echo "--> Provisioning VM"
echo "--> apt-get updating"
sudo apt-get -y update > /dev/null

echo "--> pip installing"
sudo apt-get -y install python-pip python-dev build-essential > /dev/null
sudo pip install --upgrade pip > /dev/null
# libpq-dev is a dependency of psycopg2
sudo apt-get -y install libpq-dev > /dev/null
sudo pip install -r /home/vagrant/shared/requirements.txt > /dev/null

echo "--> VM provisioned"
echo "-------------------------------------------------------------------------"
echo "--> Go build stuff!"
echo "-------------------------------------------------------------------------"
