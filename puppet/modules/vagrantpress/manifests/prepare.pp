class vagrantpress::prepare{

  if $::osfamily == 'Debian'{
    exec{"apt-get update":
      path => "/bin:/usr/bin",
    }
  }

  package{"librarian-puppet":
    ensure   => installed,
    provider => 'gem',
  }

  package{["git"]: ensure => installed,
    require => Exec["apt-get update"],
  }

  ## Not needed for non-git checkouts
  file{"/home/vagrant/.ssh": ensure => directory,}
  file{"/home/vagrant/.ssh/config":
    ensure => present,
    content => 'StrictHostKeyChecking no'
  }

  exec{"librarian-puppet update":
    path => "/bin:/usr/bin:/usr/local/bin",
    cwd  => "/vagrant/puppet",
    require => Package["librarian-puppet", "git"],
    environment => ["HOME=/home/vagrant"],
  }


}