#!/bin/bash

echo " "
echo "---{ Provisioning VM..."
echo " "

echo " "
echo "---{ Updating..."
echo " "
sudo apt-get -y update > /dev/null

echo " "
echo "---{ Installing pip & virtualenv..."
echo " "
sudo apt-get -y install python-pip python-dev build-essential > /dev/null
sudo pip install --upgrade pip > /dev/null
sudo pip install --upgrade virtualenv virtualenvwrapper > /dev/null
sudo apt-get -y install libpq-dev > /dev/null
# set the location where the virtual environments should live, and the location of the script installed with virtualenvwrapper
sudo echo " " >> /home/vagrant/.bashrc > /dev/null
sudo echo "export WORKON_HOME=/home/vagrant/.virtualenvs" >> /home/vagrant/.bashrc > /dev/null
sudo echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.bashrc > /dev/null
# reload startup file
source /home/vagrant/.bashrc > /dev/null

echo " "
echo "---{ VM provisioned."
echo " "
