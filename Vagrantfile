# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_root = File.dirname(__FILE__)
django_8000_fp = "8001"
django_80_fp = "8081"
db_8000_fp = "8002"
db_80_fp = "8082"
db_postgres_fp = "15432"
django_private_ip = "10.0.0.1"
db_private_ip = "10.0.0.2"

Vagrant.configure(2) do |config|

    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = "1"
        vb.gui = false
    end

    if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.include_offline = true
    end

    config.vm.define "django" do |django|
        django.vm.hostname = "django"
        django.vm.network "private_network", ip: django_private_ip, :netmask => "255.255.0.0"
        django.vm.network "forwarded_port", guest: 8000, host: django_8000_fp
        django.vm.network "forwarded_port", guest: 80, host: django_80_fp
        django.vm.synced_folder "#{vagrant_root}/shared", "/home/vagrant/shared"
        django.vm.provision :shell, :path => "#{vagrant_root}/provision/djangonode-setup.sh"
    end

    config.vm.define "db" do |db|
        db.vm.hostname = "db"
        db.vm.network "private_network", ip: db_private_ip, :netmask => "255.255.0.0"
        db.vm.network "forwarded_port", guest: 8000, host: db_8000_fp
        db.vm.network "forwarded_port", guest: 80, host: db_80_fp
        db.vm.network "forwarded_port", guest: 5432, host: db_postgres_fp
        db.vm.provision :shell, :path => "#{vagrant_root}/provision/dbnode-setup.sh"
    end

end
