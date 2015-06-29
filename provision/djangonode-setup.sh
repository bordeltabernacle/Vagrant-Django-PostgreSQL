#!/bin/bash

echo " "
echo "---{ Provisioning VM..."
echo " "

echo " "
echo "---{ Updating..."
echo " "
sudo apt-get -y update > /dev/null

echo " "
echo "---{ Installing pip & associated requirements..."
echo " "
sudo apt-get -y install python-pip python-dev build-essential > /dev/null
sudo pip install --upgrade pip > /dev/null
# libpq-dev is a dependency of psycopg2
sudo apt-get -y install libpq-dev > /dev/null
sudo pip install -r /home/vagrant/shared/requirements.txt > /dev/null

echo " "
echo "---{ VM provisioned."
echo " "
