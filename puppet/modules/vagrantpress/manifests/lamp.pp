# This class deploys a basic LAMP stack.

class vagrantpress::lamp(
  $web_root,
  $mysql_pass
){

  file{"${web_root}":
    ensure => directory,
    owner  => 'vagrant',
    group  => 'vagrant',
  }




  ## APACHE PREFORK
  class{"apache":
     mpm_module => 'prefork',
     default_vhost => true,
  }

  # Installs basic PHP
  class{"apache::mod::php": }

  ## INSTALL WPCLI
  wpcli{"/usr/local/bin/wp":
    ensure => present,
    require => Class["apache::mod::php"],
  }



  # NOTE:  I'll use a file here, the default vhost settings for
  # the puppetlabs module can't be easily overridden.
  # UBUNTU ONLY
  file{"/etc/apache2/sites-available/default.conf":
    ensure => present,
    content => template('vagrantpress/default-vhost.erb'),
  }->
  file{"/etc/apache2/sites-enabled/10-default.conf":
      ensure => link,
      target => "/etc/apache2/sites-available/default.conf",
      notify => Service["apache2"],
   }

  file{"${web_root}/index.php":
    ensure => present,
    content => "<?php phpinfo(); \n",
  }


  ## Install mysql
  class{"::mysql::server":
    root_password => "${mysql_pass}",
    override_options =>  { 'mysqld' => {'bind_address' => '0.0.0.0' }  }
  }

  mysql_user{'root@%':
      ensure => 'present',
      password_hash => '*81F5E21E35407D884A6CD4A731AEBFB6AF209E1B',
  }

  mysql_grant{'root@%/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['ALL'],
    table => '*.*',
    user  => 'root@%',
  }


}