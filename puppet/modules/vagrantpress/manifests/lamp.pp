# This class deploys a basic LAMP stack.

class vagrantpress::lamp(
  $web_root,
){

  file{"${web_root}":
    ensure => directory,
    owner  => 'vagrant',
    group  => 'vagrant',
  }



  class{"apache":
     mpm_module => 'prefork',
     default_vhost => true,
  }

  # NOTE:  ubuntu speicfic.
  file{"/var/log/apache2":
    ensure => 'directory',
    group  => 'www-data',
    mode   => '0775',
    recurse => true,
    notify => Service["apache2"],
  }

  class{"apache::mod::php": }

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








}