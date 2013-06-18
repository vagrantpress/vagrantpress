class apache2::install{
  
  package { "apache2": ensure => present,}

    service { "apache2":
      ensure => running,
      require => Package["apache2"],
    }

    exec{"apache-modrewrite": #tee hee
      command=>"/usr/sbin/a2enmod rewrite",
      cwd=>"/vagrant/",
    }

    file { '/etc/apache2/sites-available/default':
      owner => root,
      group => root,
      ensure => file,
      mode => 644,
      source => '/vagrant/files/etc/apache2/sites-available/default',
      require => Package["apache2"],
    }

    file { '/etc/apache2/sites-enabled/000-default':
      notify => Service["apache2"],
      ensure => link,
      target => "/etc/apache2/sites-available/default",
      require => Package["apache2"],
    }
}
