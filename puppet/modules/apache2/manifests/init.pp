# Install Apache

class apache2::install {

  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['apache2'],
    notify  => Service['apache2'],
  }
  
  package { 'apache2':
    ensure => present,
  }->

  service { 'apache2':
    ensure  => running,
  }

  # the httpd.conf change the user/group that apache uses to run its process
  file { '/etc/apache2/conf-available/user.conf':
    source  => '/vagrant/files/etc/apache2/httpd.conf',
  }
  
  file { '/etc/apache2/conf-enabled/user.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/user.conf',
  }

  file { '/etc/apache2/sites-available/default.conf':
    source  => '/vagrant/files/etc/apache2/sites-available/default.conf',
  }

  file { '/etc/apache2/mods-available/rewrite.load':
    source  => '/vagrant/files/etc/apache2/mods-available/rewrite.load',
  }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure  => link,
    target  => '/etc/apache2/sites-available/default.conf',
  }

  file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure  => link,
    target  => '/etc/apache2/mods-available/rewrite.load',
  }

}
