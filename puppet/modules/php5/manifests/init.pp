# Install PHP

class php5::install {

	package { [
	  'php5',
	  'php5-mysql',
	  'php5-curl',
	  'php5-gd',
	  'php5-fpm',
	  'libapache2-mod-php5',
	  'php5-dev',
	  'php5-xdebug',
	  'php-pear',
	]:
	ensure => present,
	}
  
	# upgrade pear
	exec {"pear upgrade":
	  command => "/usr/bin/pear upgrade",
	  require => Package['php-pear'],
	}
	
	# set channels to auto discover
	exec { "pear auto_discover" :
		command => "/usr/bin/pear config-set auto_discover 1",
		require => [Package['php-pear']]
	}
	
	# update channels
	exec { "pear update-channels" :
		command => "/usr/bin/pear update-channels",
		require => [Package['php-pear']]
	}
	
	# Set development values to our php.ini and xdebug.ini
	augeas { 'set-php-ini-values':
	    context => '/files/etc/php5/apache2/php.ini',
	    changes => [
	        'set PHP/error_reporting "E_ALL | E_STRICT"',
	        'set PHP/display_errors On',
	        'set PHP/display_startup_errors On',
	        'set PHP/html_errors On',
	     ],
	     require => Package['apache2', 'augeas-tools']
	}
}
