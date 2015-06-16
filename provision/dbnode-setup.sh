#!/bin/bash

echo "---{ Provisioning virtual machine..."

echo "---{ Updating..."
sudo apt-get -y update > /dev/null

echo "---{ Upgrading..."
sudo apt-get -y upgrade > /dev/null

echo "---{ Installing PostgreSQL..."
sudo apt-get -y install postgresql postgresql-contrib > /dev/null
