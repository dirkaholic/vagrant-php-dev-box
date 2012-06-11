Set up a PHP development box super fast
=======================================

Installation
------------

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Add a Ubuntu Precise box using the [available official boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes), for example: ```vagrant box add precise64 http://files.vagrantup.com/precise64.box```
* Clone this repository
* Run ```vagrant init precise64``` for a single time (use choosen box name) inside the cloned repository
* After running ```vagrant up``` the box is set up using Puppet
* You should now have your working Symfony2 Standard Edition under http://localhost:9090/app_dev.php

Installed components
--------------------

* [Nginx](http://nginx.org)
* [php-fpm](http://php-fpm.org)
* [git](http://git-scm.com/)
* [pear](http://pear.php.net/)
* [Node.js](http://nodejs.org/)
* [npm](http://npmjs.org/)
* [Symfony2 Standard Edition](https://github.com/symfony/symfony-standard)
* [MySQL](http://dev.mysql.com/downloads/mysql/)
* [MongoDB](http://www.mongodb.org/)

TODO
----

* Make used packages choosable like Apache vs. Nginx vs. ...


