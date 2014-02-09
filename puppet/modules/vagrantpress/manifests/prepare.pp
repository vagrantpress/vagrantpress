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

  file{"/tmp/librarian-puppet":
    ensure => directory,
    mode => 0775,
  }

  exec{"librarian-puppet update":
    path => "/bin:/usr/bin:/usr/local/bin",
    cwd  => "/vagrant/puppet",
    require => [Package["librarian-puppet", "git"], File["/tmp/librarian-puppet"]],
    environment => ["HOME=/home/vagrant", "LIBRARIAN_PUPPET_TMP=/tmp/librarian-puppet"],
  }


}