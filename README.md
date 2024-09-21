# EECS 4302

## Setup
#### Prereqs
1. Install latest version of Hashicorp Vagrant: https://developer.hashicorp.com/vagrant/install?product_intent=vagrant
2. Install latest version of Oracle Virtual Box: https://www.virtualbox.org/wiki/Downloads

#### Startup your machine

        vagrant up

#### Destroy your machine

        vagrant destroy

#### SSH into your machine

        vagrant ssh

#### How to use this portable development environment
Assignment folders are synced to 

        /home/dev/a1
        /home/dev/a2
        /home/dev/a3
        /home/dev/a4

on the VM. You may SSH into the machine, cd into the relevant assignment folder and run:

        make
