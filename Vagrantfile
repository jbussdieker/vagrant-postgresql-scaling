# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
CLUSTER_SIZE = (ENV["CLUSTER_SIZE"] || 2).to_i

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end

  CLUSTER_SIZE.times do |index|
    name = "db#{index + 1}"

    config.vm.define name do |box|
      box.vm.box = "http://cloud-images.ubuntu.com/vagrant/trusty/20140712/trusty-server-cloudimg-amd64-vagrant-disk1.box"
      box.vm.hostname = name
      box.vm.network "private_network", ip: "10.0.255.#{index + 3}"
      box.vm.provision "puppet"
    end
  end
end
