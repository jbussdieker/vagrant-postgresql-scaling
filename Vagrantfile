# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.memory = 512
    virtualbox.cpus = 1
  end

  Dir[File.join("hieradata/node", "*.yaml")].sort.each do |node_yaml|
    require 'yaml'
    node = YAML.load_file(node_yaml)
    name = File.basename(node_yaml).split(".").first
    config.vm.define name do |box|
      box.vm.hostname = name
      box.vm.box = "http://cloud-images.ubuntu.com/vagrant/trusty/20140712/trusty-server-cloudimg-amd64-vagrant-disk1.box"
      box.vm.network "private_network", ip: node["ipaddress"]
      box.vm.network "forwarded_port", guest: 5432, host: 5432, auto_correct: true
      box.vm.provision "puppet" do |puppet|
        puppet.hiera_config_path = "hiera.yml"
        puppet.module_path = "modules"
        puppet.options = "--show_diff"
      end
    end
  end
end
