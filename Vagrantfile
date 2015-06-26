# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = "1"
    end

    if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.include_offline = true
    end

    config.vm.define "django" do |django|
        django.vm.hostname = "django"
        django.vm.network "private_network", ip: "10.101.8.101", :netmask => "255.255.0.0"
        django.vm.network "forwarded_port", guest: 8000, host: 8001
        django.vm.network "forwarded_port", guest: 80, host: 8081
        django.vm.synced_folder "/home/willem/vagrant-machines/django-LLD-dev-02/shared", "/home/vagrant/shared"
        django.vm.provision :shell, :path => "/home/willem/vagrant-machines/django-LLD-dev-02/provision/djangonode-setup.sh"
    end

    config.vm.define "db" do |db|
        db.vm.hostname = "db"
        db.vm.network "private_network", ip: "10.101.8.102", :netmask => "255.255.0.0"
        db.vm.network "forwarded_port", guest: 8000, host: 8002
        db.vm.network "forwarded_port", guest: 80, host: 8082
        db.vm.network "forwarded_port", guest: 5432, host: 15432
        db.vm.provision :shell, :path => "/home/willem/vagrant-machines/django-LLD-dev-02/provision/dbnode-setup.sh"
    end

end
