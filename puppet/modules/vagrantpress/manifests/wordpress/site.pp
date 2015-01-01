define vagrantpress::wordpress::site (
  $site_root,
  $site_title,
  $site_hostname,
  $admin_user,
  $admin_password,
  $admin_email,
  $multisite
) {




     notify{"Create Site ${site_title}": }

     # Set up NGINX Virtual Host


    nginx::resource::vhost {"${site_hostname}":
      www_root => "${site_root}",
      require => File["${site_root}"],
      location_cfg_append => {
        try_files => ' $uri $uri/ /index.php?$args',
      },
    }
#
#    # Define nginx locaiton directives
#    nginx::resource::location { "${site_root}":
#      ensure          => present,
#      ssl             => false,
#      vhost           => "${site_hostname}",
#      www_root        => "${site_root}",
#      location        => '~ \.php$',
#      index_files     => ['index.php', 'index.html', 'index.htm'],
#      proxy           => undef,
#      fastcgi         => "127.0.0.1:${backend_port}",
#      fastcgi_script  => undef,
#      location_cfg_append => {
#        fastcgi_connect_timeout => '3m',
#        fastcgi_read_timeout    => '3m',
#        fastcgi_send_timeout    => '3m'
#      }
#    }




    # Verify that site root exists.

     # Download the wordpress core distribution

     # Install the database (use backup file?)

     # Install and activate plugins.

}
