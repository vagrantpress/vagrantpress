class vagrantpress::vp-nginx{

  include nginx

  file{"/vagrant/html":
    ensure => directory,
    owner => 'vagrant'
  }

  nginx::resource::vhost {'localhost':
    www_root => '/vagrant/html',
    require => File["/vagrant/html"],
  }

}