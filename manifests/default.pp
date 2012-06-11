# Basic Puppet manifest

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update {

  exec { 'apt-get update':
    command => 'apt-get update'
  }
}

class php5 {

  package { "php5":
    ensure => present,
  }

  $fpmPrerequisites = [ "php5-cli", "php5-common", "php5-suhosin", "php-apc", "php5-intl", "php5-xdebug", "php5-mysql" ]
  package { $fpmPrerequisites:
    ensure => "installed",
    notify => Service["php5-fpm"],
  }

  # as there was an issue in installation order we install that separatly
  package { "php5-cgi":
    ensure => installed,
  }

  package { "php5-fpm":
    ensure => present,
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
  }

  file { "/etc/php5/fpm/pool.d/www.conf":
    owner  => root,
    group  => root,
    mode   => 664,
    source => "/vagrant/conf/php/php-fpm/www.conf",
    notify => Service["php5-fpm"],
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

  $devPackages = [ "curl", "git", "php-pear", "nodejs", "npm" ]
  package { $devPackages: ensure => "installed" }

  exec { 'install less using npm':
    command => 'npm install less -g'
  }
}

class symfony-standard {

  exec { 'git clone symfony standard':
      command => 'git clone https://github.com/symfony/symfony-standard.git /vagrant/www/symfony',
      creates => "/vagrant/www/symfony"
  }

  exec { 'install composer for symfony':
    command => 'curl -s http://getcomposer.org/installer | php -- --install-dir=/vagrant/www/symfony'
  }

  exec { 'run composer for symfony':
    command => 'php composer.phar install --prefer-source',
    cwd => "/vagrant/www/symfony"
  }

#  file { "/vagrant/www/symfony/app/cache":
#    mode => 777,
#    recurse => true
#  }
}

include system-update
include php5
include nginx
include development
include symfony-standard


