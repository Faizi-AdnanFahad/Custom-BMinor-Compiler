# EECS 4302

## SETUP
#### Prereqs
1. Install latest version of Hashicorp Vagrant https://developer.hashicorp.com/vagrant/install?product_intent=vagrant
2. Install Latest version of Oracle Virtual Box https://www.virtualbox.org/wiki/Downloads

#### Startup your machine

        vagrant up

#### SSH into your machine

        vagrant ssh
        cd a1 # working directory synced with host machine

#### /home/dev/a1 directory structure
        ├── helper.c
        ├── helper.h
        ├── main.c
        ├── Makefile
        ├── provision_dev.sh
        ├── README.md
        ├── run-tests.sh
        ├── scanner.c
        ├── scanner.flex
        ├── tests
        │   └── scanner
        │       ├── bad10.bminor
        │       ├── bad11.bminor
        │       ├── bad12.bminor
        │       ├── bad13.bminor
        │       ├── bad14.bminor
        │       ├── bad15.bminor
        │       ├── bad1.bminor
        │       ├── bad2.bminor
        │       ├── bad3.bminor
        │       ├── bad4.bminor
        │       ├── bad5.bminor
        │       ├── bad6.bminor
        │       ├── bad7.bminor
        │       ├── bad8.bminor
        │       ├── bad9.bminor
        │       ├── good10.bminor
        │       ├── good11.bminor
        │       ├── good12.bminor
        │       ├── good13.bminor
        │       ├── good14.bminor
        │       ├── good15.bminor
        │       ├── good1.bminor
        │       ├── good2.bminor
        │       ├── good3.bminor
        │       ├── good4.bminor
        │       ├── good5.bminor
        │       ├── good6.bminor
        │       ├── good7.bminor
        │       ├── good8.bminor
        │       ├── good9.bminor
        │       ├── README
        │       └── run_all_tests.sh
        ├── token.h
        └── Vagrantfile

#### How to use
Your repository folder synced to the Ubuntu VM folder /home/dev/a1. This means you can edit the files (do you coding on windows or what your host operating system is and run the binary and tests after remoting into the VM. The files will be synced in real time)