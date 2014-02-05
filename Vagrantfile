# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box      = 'precise64'
  config.vm.network 'forwarded_port', guest: 80, host: 8080, auto_correct: true

  #"http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_fedora-19_chef-provisionerless.box"

  # Enable symlinks
  config.vm.provider "virtualbox" do |v|
    ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. If you're using either port a new one will be autoatically used.
  #config.vm.network :forwarded_port, guest: 2368, host: 1234, auto_correct: true

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
    provider.private_networking = true
  end

  config.vm.define :dev do |m|
    m.vm.hostname = 'm-blog'
    m.vm.provision :shell ,inline: <<-SHELL
      if [ -z $(getent passwd vagrant) ]; then
        sudo useradd vagrant
      fi
    SHELL

    m.vm.provision :docker
    m.vm.provision :shell, inline: <<-SHELL
      sudo mkdir -p /var/ghost/content/data
      sudo mkdir -p /var/ghost/content/images
      sudo docker build -t blog /vagrant
      sudo docker stop blog
      sudo docker rm blog
      sudo docker run -d -e NODE_ENV=development -p 80:8080 -v /var/ghost/content/data:/ghost/content/data:rw -v /var/ghost/content/images:/ghost/content/images:rw -name blog blog
    SHELL
  end

  config.vm.define :production do |m|
    m.vm.hostname = 'm-blog'
    m.vm.provision :shell ,inline: <<-SHELL
      if [ -z $(getent passwd vagrant) ]; then
        sudo useradd vagrant
      fi
    SHELL
    m.vm.provision :docker
    m.vm.provision :shell, inline: <<-SHELL
      sudo mkdir -p /var/ghost/content/data
      sudo mkdir -p /var/ghost/content/images
      sudo docker build -t blog /vagrant
      sudo docker stop blog
      sudo docker rm blog
      sudo docker run -d -e NODE_ENV=production -p 80:8080 -v /var/ghost/content/data:/ghost/content/data:rw -v /var/ghost/content/images:/ghost/content/images:rw -name blog blog
    SHELL
  end

end
