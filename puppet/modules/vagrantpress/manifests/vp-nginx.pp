class vagrantpress::vp-nginx{

  include nginx

  $web_root = "/vagrant/html"
  $hostname = "localhost"
  $backend_port = "9000"


  file{"${web_root}":
    ensure => directory,
    owner => 'vagrant'
  }

  nginx::resource::vhost {"${hostname}":
    www_root => "${web_root}",
    require => File["${web_root}"],
    location_cfg_append => {
      try_files => ' $uri $uri/ /index.php?$args',

   },
  }


  nginx::resource::location { "${web_root}":
    ensure          => present,
    ssl             => false,
    vhost           => "${hostname}",
    www_root        => "${web_root}",
    location        => '~ \.php$',
    index_files     => ['index.php', 'index.html', 'index.htm'],
    proxy           => undef,
    fastcgi         => "127.0.0.1:${backend_port}",
    fastcgi_script  => undef,
    location_cfg_append => {
      fastcgi_connect_timeout => '3m',
      fastcgi_read_timeout    => '3m',
      fastcgi_send_timeout    => '3m'
    }
  }
}