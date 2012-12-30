Set up a PHP development box super fast
=======================================

Installation
------------

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Add a Ubuntu Precise box using the [available official boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes), for example: ```vagrant box add phpdevbox http://files.vagrantup.com/precise64.box``` (make sure it's named phpdevbox)
* Clone this repository
* Install submodules with ```git submodule update --init```
* After running ```vagrant up``` the box is set up using Puppet
* You should now have your working Symfony2 Standard Edition under http://localhost:8181/app_dev.php (You have to uncomment or remove some lines at the beginning of web/app_dev.php that restrict access to this file. Is no risk as you should not deploy that file to prodution anyway.)

Installed components
--------------------

* [Nginx](http://nginx.org) using puppet module (https://github.com/example42/puppet-nginx)
* [Apache](http://httpd.apache.org/) using puppet module (https://github.com/example42/puppet-apache)
* [php-fpm](http://php-fpm.org) using puppet module (https://github.com/saz/puppet-php)
* [git](http://git-scm.com/)
* [pear](http://pear.php.net/) using puppet module (https://github.com/rafaelfelix/puppet-pear)
* [Node.js](http://nodejs.org/)
* [npm](http://npmjs.org/)
* [less](http://lesscss.org/)
* [Symfony2 Standard Edition](https://github.com/symfony/symfony-standard)
* [MySQL](http://dev.mysql.com/downloads/mysql/) using puppet module (https://github.com/example42/puppet-mysql)
* [MongoDB](http://www.mongodb.org/) using puppet module (https://github.com/puppetlabs/puppetlabs-mongodb)
* [Capistrano](https://github.com/capistrano/capistrano)
* [capifony](http://capifony.org/)
* Most of the [phpqatools](http://www.phpqatools.org) using puppet module (https://github.com/rafaelfelix/puppet-phpqatools)

Debugging
---------

If you want to debug your cli application using xdebug for example with Netbeans just run this command before executing the cli app:

.. code-block:: sh

    $ export XDEBUG_CONFIG="idekey=netbeans-xdebug remote_host=192.168.33.1 profiler_enable=1 default_enable=1 remote_enable=1 remote_handler=dbgp remote_port=9000 remote_autostart=0"

Hints
-----

**Startup speed**

To speed up the startup process use

.. code-block:: sh

    $ vagrant up --no-provision

after the first run. It just starts the virtual machine without provisioning of the recipes.

TODO
----
