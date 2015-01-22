# Install the PHP Quality Assurance Toolchain

class phpqa::install{

	# install phpunit
  exec { "composer install phpunit":
    command => 'composer global require "phpunit/phpunit=4.4.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install phploc
  exec { "composer install phploc":
    command => 'composer global require "phploc/phploc=*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install phpcpd
  exec { "composer install phpcpd":
    command => 'composer global require "sebastian/phpcpd=*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install phpcs
  exec { "composer install phpcs":
    command => 'composer global require "squizlabs/php_codesniffer=2.1.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install WordPress Coding Standard sniffs
	# http:////github.com/WordPress-Coding-Standards/WordPress-Coding-Standards
	exec { "Install WP phpcs sniffs":
		command => "/usr/bin/git clone git://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git /usr/share/php/PHP/CodeSniffer/Standards/WordPress",
		unless  => "/usr/bin/test -d /usr/share/php/PHP/CodeSniffer/Standards/WordPress",
		require => Exec['install composer', 'composer install phpcs']
	}

  # install pdepend
  exec { "composer install pdepend":
    command => 'composer global require "pdepend/pdepend=2.0.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install phpmd
  exec { "composer install phpmd":
    command => 'composer global require "phpmd/phpmd=2.1.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }

  # install PHP_CodeBrowser
  exec { "composer install PHP_CodeBrowser":
    command => 'composer global require "mayflower/php-codebrowser=~1.1"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Exec['install composer']
  }
  

}