# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Using the default hashicorp / Ubuntu 12.04 LTS version.
  # If you would like to use a different box, edit this parameter.
  config.vm.box = "hashicorp/precise64"

  # Set a box hostname
  config.vm.hostname = "vagrantpress"

  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Forwarded ports for the virtual box.  If you would like to
  # connect to the box on port 8080. you'll want to uncomment
  # that line.  For using virtual hosts, you may want to modify this
  # to...
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host:13306


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"



  # A bootstrapping shell for checking for puppet.
  config.vm.provision "shell", path: "shell/bootstrap.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    #puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "site.pp"
    puppet.working_directory = '/vagrant/puppet'
    puppet.manifest_file  = "site.pp"
    #puppet.options = "--hiera_config=/vagrant/puppet/hiera.yaml"
    #puppet.options="--verbose --debug"
  end

end