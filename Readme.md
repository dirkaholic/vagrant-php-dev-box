Set up a PHP development box super fast
=======================================

Installation
------------

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Add a Ubuntu Precise box using the [available official boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes), for example: ```vagrant box add phpdevbox http://files.vagrantup.com/precise64.box```
* Clone this repository
* Install submodules with ```git submodule init``` and ```git submodule update```
* Run ```vagrant init phpdevbox``` for a single time (use choosen box name) inside the cloned repository
* After running ```vagrant up``` the box is set up using Puppet
* You should now have your working Symfony2 Standard Edition under http://localhost:9191/app_dev.php

Installed components
--------------------

* [Nginx](http://nginx.org)
* [Apache](http://www.apache.org/) using puppet module (https://github.com/example42/puppet-apache)
* [php-fpm](http://php-fpm.org)
* [git](http://git-scm.com/)
* [pear](http://pear.php.net/)
* [Node.js](http://nodejs.org/)
* [npm](http://npmjs.org/)
* [less](http://lesscss.org/)
* [Symfony2 Standard Edition](https://github.com/symfony/symfony-standard)
* [MySQL](http://dev.mysql.com/downloads/mysql/)
* [MongoDB](http://www.mongodb.org/)
* [Capistrano](https://github.com/capistrano/capistrano)
* [capifony](http://capifony.org/)
* [phpunit](http://www.phpunit.de)



