exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

# install php7.2 package
package { ['php7.4', 'php7.4-mysql']: 
  require => Exec['apt-update'], # require 'apt-update' before installing
  ensure => installed,
}

exec { 'run-php7':
  require => Package['php7.4'],
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
}
