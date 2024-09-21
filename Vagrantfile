# AUTHOR: Ali Umar
# Date: 2024-09-20
# Description: Spin up an ubuntu vm and sync assignment folders for a portable dev environment

VAGRANT_COMMAND = ARGV[0]
# Function to check whether VM was already provisioned
def provisioned?(vm_name='default', provider='virtualbox')
  File.exist?(".vagrant/machines/#{vm_name}/#{provider}/action_provision")
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.box_version = "202407.23.0"
  config.vm.provision "shell", path: "provision.sh"
  # fix hang on ssh? 
  config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end
  # if provision script ran, use dev account to ssh
  config.ssh.username = 'dev' if provisioned?

  # Create synced folders
  # TODO: A2, A3, A4
  config.vm.synced_folder "a1/", "/home/dev/a1"
  #config.vm.synced_folder "a2/", "/home/dev/a2"
  #config.vm.synced_folder "a3/", "/home/dev/a3"
  #config.vm.synced_folder "a4/", "/home/dev/a4"
end


