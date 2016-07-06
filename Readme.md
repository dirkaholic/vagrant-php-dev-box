Set up a PHP development box super fast
=======================================
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/dirkaholic/vagrant-php-dev-box?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Installation
------------

* Install vagrant using the installation instructions in the [Getting Started document](https://www.vagrantup.com/docs/getting-started/)
* Clone this repository and cd into it
* Run ```vagrant up``` in order to set up the box using the ansible provisioner
* You should now have your working Symfony2 Standard Edition under http://192.168.50.4/

The installation process will create a folder symfony-standard inside 
the main directory of the repository. You can now start working inside 
this folder directly on your host computer using your favourite IDE. 
Changes done there will be reflected directly on the vagrant box as the 
directory is mounted in the vagrant box under '''/vagrant'''. Also you 
can login into the box using ```vagrant ssh``` and have the full control 
over processes etc.

As the provisioning using the ansible provisioner is very fast you can 
repeat the whole procedure at any time. In order to start fresh just run
```vagrant destroy``` and ```vagrant up```. This will undo all you manual 
changes done on the vagrant box and provide you with a clean setup.

Installed components
--------------------

* [Nginx](http://nginx.org)
* [MySQL](http://dev.mysql.com/downloads/mysql/)
* [php-fpm](http://php-fpm.org)
* [git](http://git-scm.com/)
* [Symfony2 Standard Edition](https://github.com/symfony/symfony-standard)
