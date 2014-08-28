class vagrantpress::vp-phpfpm{


  # This is Ubuntu only for now..

  package{["php5-fpm", "php5-curl", "php5-mysql"]:
    ensure => installed,
  }

  # Put the files in place. Create a 'wordpress' pool.

  file{"/etc/php5/fpm/pool.d/www.conf":
    ensure => absent,
    notify => Service["php5-fpm"],
  }

  file{"/etc/php5/fpm/pool.d/wordpress.conf":
    ensure => present,
    source => "puppet:///modules/vagrantpress/php/wordpress.conf",
    notify => Service["php5-fpm"],
  }

  service{"php5-fpm":
    ensure => running,
  }




}