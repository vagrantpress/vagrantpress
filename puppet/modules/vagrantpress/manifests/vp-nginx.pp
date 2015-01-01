class vagrantpress::vp-nginx{

  include nginx

  $web_root = "/vagrant/html"
  $hostname = "localhost"
  $backend_port = "9000"


  file{"${web_root}":
    ensure => directory,
    owner => 'vagrant'
  }


}