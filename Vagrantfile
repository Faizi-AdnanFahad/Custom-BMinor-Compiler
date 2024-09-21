VAGRANT_COMMAND = ARGV[0]
#
# Function to check whether VM was already provisioned
def provisioned?(vm_name='default', provider='virtualbox')
  File.exist?(".vagrant/machines/#{vm_name}/#{provider}/action_provision")
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.box_version = "202407.23.0"
  config.vm.provision "shell", path: "provision_dev.sh"
  # if provision script ran, use dev account to ssh
  if VAGRANT_COMMAND == "ssh"
    config.ssh.username = 'dev' if provisioned?
  end
end
