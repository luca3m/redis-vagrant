# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

HOSTS = { "redis01" => "192.168.57.2",
          "redis02" => "192.168.57.3",
          "redis03" => "192.168.57.4"
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  HOSTS.each do |r|
    config.vm.define r[0] do |v|
      v.vm.provision 'shell', path: "provision.sh"
      v.vm.box = "ubuntu/trusty32"
      v.vm.provider "virtualbox" do |vbox|
        vbox.memory = 256
        vbox.cpus = 1
      end
      v.vm.network :private_network, ip: r[1]
      v.vm.hostname = r[0]
    end
  end
end
