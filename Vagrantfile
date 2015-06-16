# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.box = "ubuntu/trusty64"
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
        django.vm.network "private_network", ip: "10.101.8.101"
        django.vm.synced_folder "B:\\vagrant\\repeatable-design\\django-LLD-dev-02\\shared", "/home/vagrant/shared"
        django.vm.provision :shell, :path => "provision\\djangonode-setup.sh"
    end

    config.vm.define "db" do |db|
        db.vm.hostname = "db"
        db.vm.network "private_network", ip: "10.101.8.102"
        db.vm.provision :shell, :path => "provision\\dbnode-setup.sh"
    end

end
