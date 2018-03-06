Set up a PHP development box super fast
=======================================

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dirkaholic/vagrant-php-dev-box?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Installation
------------

* Install [VirtualBox](https://www.virtualbox.org/)
* Install vagrant using the installation instructions in the [Getting Started document](https://www.vagrantup.com/docs/getting-started/)
* Clone this repository and cd into it
* Run ```vagrant up``` in order to set up the box using the ```ansible_local``` provisioner
* You should now have your working 
    * Symfony2 Standard Edition under https://192.168.50.4:8081/
    * Laravel Quickstart example app under https://192.168.50.4:8082/
    * CakePHP base installation under https://192.168.50.4:8083/
    * Wordpress base installation under https://192.168.50.4:8084/

The installation process will create folders symfony-standard, laravel-quickstart, cakephp, wordpress inside 
the main directory of the repository. You can now start working inside 
these folders directly on your host computer using your favourite IDE. 
Changes done there will be reflected directly on the vagrant box as the 
directory is mounted in the vagrant box under ```/vagrant```. Also you 
can login into the box using ```vagrant ssh``` and have the full control 
over processes etc.

As the provisioning using the ansible provisioner is very fast you can 
repeat the whole procedure at any time. In order to start fresh just run
```vagrant destroy``` and ```vagrant up```. This will undo all you manual 
changes done on the vagrant box and provide you with a clean setup.

NOTE: You must delete or move the development folders prior to ```vagrant up``` after a destroy. If these folders exist, the process will fail. 

Installed components
--------------------

* [Nginx](http://nginx.org)
* [MySQL](http://dev.mysql.com/downloads/mysql/)
* [PHP 7.0](http://www.php.net/)
* [php-fpm](http://php-fpm.org)
* [git](http://git-scm.com/)
* [Composer](https://getcomposer.org/)
* [CakePHP 3](https://cakephp.org)
* [Wordpress](https://wordpress.org)
* [Symfony2 Standard Edition](https://github.com/symfony/symfony-standard)
* [Laravel](https://laravel.com/)
* [NodeJS](https://nodejs.org)
* [PHPUnit](https://phpunit.de/)

If you don't like/need some of the components just remove them from the roles section in playbook/vagrant.yml.

Changes
-------

### unreleased
### v1.4.1

* Introduce php_version variable, set PHP default version to 7.0 [#33](https://github.com/dirkaholic/vagrant-php-dev-box/pull/33)
* Upgrade Ubuntu box to 16.04 (latest LTS version) [#33](https://github.com/dirkaholic/vagrant-php-dev-box/pull/33)

### v1.4.0

* Transfer ansible playbooks to roles [#31](https://github.com/dirkaholic/vagrant-php-dev-box/pull/31)

### v1.3.0

* Switch provisioner to ansible [#18](https://github.com/dirkaholic/vagrant-php-dev-box/pull/18)

### v1.0.0

* Provision development environment using puppet
