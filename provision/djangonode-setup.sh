#!/bin/bash

echo "---{ Provisioning virtual machine..."

echo "---{ Updating..."
sudo apt-get -y update > /dev/null

echo "---{ Upgrading..."
sudo apt-get -y upgrade > /dev/null

echo "---{ Installing Git..."
sudo apt-get -y install git > /dev/null

echo "---{ Installing pip..."
sudo apt-get -y install python-pip python-dev build-essential > /dev/null
sudo pip install --upgrade pip > /dev/null
sudo pip install --upgrade virtualenv > /dev/null

echo "---{ Installing pip packages..."
sudo apt-get -y install libpq-dev > /dev/null
sudo pip install -r /home/vagrant/shared/requirements.txt > /dev/null
