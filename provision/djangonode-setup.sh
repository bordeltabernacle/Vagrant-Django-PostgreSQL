#!/bin/bash

echo "-------------------------------------------------------------------------"
echo "--> Provisioning Django Virtual Machine"
echo "-------------------------------------------------------------------------"
echo "--> apt-get updating"
sudo apt-get -y update > /dev/null 2>&1

echo "--> pip installing"
sudo apt-get -y install python-pip python-dev build-essential > /dev/null 2>&1
sudo pip install --upgrade pip > /dev/null 2>&1
# libpq-dev is a dependency of psycopg2
sudo apt-get -y install libpq-dev > /dev/null 2>&1
sudo pip install -r /home/vagrant/shared/requirements.txt > /dev/null 2>&1

echo "--> Django Virtual Machine provisioned"
echo "-------------------------------------------------------------------------"
echo "--> Go build stuff!"
echo "-------------------------------------------------------------------------"
