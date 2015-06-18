#!/bin/bash

echo " "
echo "---{ Provisioning virtual machine..."
echo " "

echo " "
echo "---{ Updating..."
echo " "
sudo apt-get -y update > /dev/null

echo " "
echo "---{ Installing Git..."
echo " "
sudo apt-get -y install git > /dev/null

echo " "
echo "---{ Installing pip & virtualenv..."
echo " "
sudo apt-get -y install python-pip python-dev build-essential > /dev/null
sudo pip install --upgrade pip > /dev/null
sudo pip install virtualenvwrapper > /dev/null
sudo apt-get -y install libpq-dev > /dev/null
# set the location where the virtual environments should live, and the location of the script installed with virtualenvwrapper
sudo echo -e "\nexport WORKON_HOME=$HOME/.virtualenvs\nsource /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.bashrc
# reload startup file
source /home/vagrant/.bashrc > /dev/null
