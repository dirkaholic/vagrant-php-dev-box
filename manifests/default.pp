# Basic Puppet manifest

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update {

  file { "/etc/apt/sources.list.d/10gen.list":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/apt/10gen.list",
  }

  exec { 'import the 10gen public GPG key':
    command => 'apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10'
  }

  exec { 'apt-get update':
    command => 'apt-get update',
    require => Exec['import the 10gen public GPG key'],
  }

  $sysPackages = [ "build-essential" ]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

class php5 {

  package { "php5":
    ensure => present,
  }

  $phpPackages = [ "php5-cli", "php5-common", "php5-suhosin", "php-apc", "php5-intl", "php5-xdebug", "php5-mysql", "php5-sqlite", "php5-dev" ]
  package { $phpPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
    notify => Service["php5-fpm"],
  }

  # as there was an issue in installation order we install that separatly
  package { "php5-cgi":
    ensure => installed,
    require => Exec['apt-get update'],
  }

  exec { 'install PHP MongoDB extension via pecl':
    command => 'pecl install mongo',
    unless => "pecl info mongo",
    notify => Service["php5-fpm"],
  }

  package { "php5-fpm":
    ensure => present,
    require => Exec['apt-get update'],
  }

  service { "php5-fpm":
    ensure => running,
    require => Package["php5-fpm"],
  }

  file { "/etc/php5/conf.d/suhosin.ini":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/php/suhosin.ini",
    notify => Service["php5-fpm"],
  }

  file { "/etc/php5/conf.d/custom.ini":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/php/custom.ini",
    notify => Service["php5-fpm"],
    require => Package["php5-common"],
  }

  file { "/etc/php5/fpm/pool.d/www.conf":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/php/php-fpm/www.conf",
    notify => Service["php5-fpm"],
    require => Package["php5-fpm"],
  }
}

class nginx {

  package { "nginx":
    ensure => present,
  }

  service { "apache2":
  	ensure => "stopped",
  }
	
  service { "nginx":
    ensure => running,
    require => Package["nginx"],
  }

  file { "/etc/nginx/sites-available/php-fpm":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/nginx/default",
  }

  file { "/etc/nginx/sites-enabled/default":
    owner  => root,
    ensure => link,
    target => "/etc/nginx/sites-available/php-fpm",
    notify => Service["nginx"],
  }
}

class development {

  $devPackages = [ "curl", "git", "php-pear", "nodejs", "npm", "mongodb-10gen", "capistrano", "rubygems" ]
  package { $devPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }

  exec { 'install less using npm':
    command => 'npm install less -g',
    require => Package["npm"],
  }

  exec { 'install capifony using RubyGems':
    command => 'gem install capifony',
    require => Package["rubygems"],
  }

  exec { 'install capistrano_rsync_with_remote_cache using RubyGems':
    command => 'gem install capistrano_rsync_with_remote_cache',
    require => Package["capistrano"],
  }

  service { "mongodb":
    ensure => running,
    require => Package["mongodb-10gen"],
  }
}

class symfony-standard {

  exec { 'git clone symfony standard':
      command => 'git clone https://github.com/symfony/symfony-standard.git /vagrant/www/symfony',
      creates => "/vagrant/www/symfony"
  }

  exec { 'install composer for symfony when needed':
    command => 'curl -s http://getcomposer.org/installer | php -- --install-dir=/vagrant/www/symfony',
    onlyif  => "test -e /vagrant/www/symfony/composer.json",
  }

  exec { 'run composer for symfony when composer is used':
    command => 'php composer.phar install --prefer-source',
    cwd => "/vagrant/www/symfony",
    onlyif  => "test -e /vagrant/www/symfony/composer.json",
  }

  exec { 'run vendor installation from deps when composer is not used':
    command => 'php bin/vendors install',
    cwd => "/vagrant/www/symfony",
    unless  => "test -e /vagrant/www/symfony/composer.json",
  }
}

include system-update
include php5
include nginx
include development
include symfony-standard


