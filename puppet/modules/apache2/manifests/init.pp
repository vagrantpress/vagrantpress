class apache2::install{
  
  package { "apache2": ensure => present,}

    service { "apache2":
      ensure => running,
      require => Package["apache2"],
    }

    file { '/var/www':
      ensure => link,
      target => "/vagrant",
      notify => Service['apache2'],
      force  => true
    }
  }
