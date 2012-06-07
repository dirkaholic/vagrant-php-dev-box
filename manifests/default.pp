# Basic Puppet manifest

class apt-get-update {

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
}

class php5 {

  package { "php5":
    ensure => present,
  }

  $fpmPrerequisites = [ "php5-cli", "php5-common", "php5-suhosin" ]
  package { $fpmPrerequisites: ensure => "installed" }

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
    command => '/usr/bin/npm install less -g'
  }
}

include apt-get-update
include php5
include nginx
include development


