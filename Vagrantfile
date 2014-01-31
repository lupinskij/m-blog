# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # Kick off bootstrap script
  config.vm.provision :shell, :path => "bootstrap.sh"

  # Enable symlinks
  config.vm.provider "virtualbox" do |v|
    ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. If you're using either port a new one will be autoatically used.
  config.vm.network :forwarded_port, guest: 2368, host: 80, auto_correct: true

  config.vm.define :blog do |machine|
    machine.vm.hostname = "m-ghost-blog"
  end

  ## Set up a shared folder.
  config.vm.synced_folder "shared/", "/home/vagrant/shared"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
  end
end
