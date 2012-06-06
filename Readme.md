Set up a PHP development box super fast
=======================================

Installation
------------

- Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
- Add a Ubuntu Precise box using the available official boxes here: https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes, for example:
  > ```vagrant box add precise64 http://files.vagrantup.com/precise64.box```  
- Run ```vagrant init precise64``` for a single time (use choosen box name)
- After running ```vagrant up``` you should have your working nginx pointing to the www directory as document root here: http://localhost:9090/ (showing phpinfo() ouput actually)

