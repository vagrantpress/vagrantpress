# This class deploys a basic LAMP stack.

class vagrantpress::vp-mysql(
  $web_root,
  $mysql_pass
){



  ## INSTALL WPCLI
  wpcli{"/usr/local/bin/wp":
    ensure => present,
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