#######################################
# This script serves to setup the Ubuntu VM and install dependencies needed
# to setup the development environment for EECS-4302
# It is intended to be used with Vagrant VM IaC tool
#######################################

# GLOBALS
USERNAME=dev
FLEX_VERSION="2.6.4"

# Install deps
echo "update machine"
sudo apt-get upgrade -y --force-yes
sudo apt-get update -y --force-yes

echo "install gcc + build tools"
sudo apt-get -y install build-essential
sudo apt-get -y install flex

# Create user account
# Default shell bash
# Primary group dev
# Secondary groups wheel vagrant
# SSH_KEY AUTH by default
# /home/dev
#
echo "create dev account"
# Create dev group
sudo groupadd dev
id -u dev &>/dev/null || sudo adduser \
   --system \
   --shell /bin/bash \
   --gecos 'dev account' \
   --ingroup dev \
   --disabled-password \
   --home /home/dev \
   $USERNAME 
sudo usermod -aG vagrant,sudo dev

# Create SSH config for new user
sudo chown dev:dev /home/dev
sudo mkdir -p /home/dev/.ssh
sudo cp /home/vagrant/.ssh/authorized_keys /home/dev/.ssh/authorized_keys
sudo chown dev:vagrant /home/dev/.ssh/authorized_keys
sudo chmod 600 /home/dev/.ssh/authorized_keys

# bash config
# uncomment for vim motions in bash
echo "set -o vi" >> /home/dev/.bash_profile 

# Assignment 1 dir
sudo ln -sf /vagrant /home/dev/a1 

# TODO: A2, A3, A4
