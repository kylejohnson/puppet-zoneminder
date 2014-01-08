class zoneminder::install::zoneminder {

  exec { "clone-zoneminder":
    command => "git clone $zoneminder::params::zoneminder_source zoneminder",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/zoneminder",
    before => Exec["checkout-branch"]
  }

  exec { "checkout-branch":
    command => "git checkout $zoneminder::params::zoneminder_branch",
    cwd => "/usr/local/src/zoneminder",
    before => File["/usr/local/src/zoneminder/configure.sh"]
  }

  file { "/usr/local/src/zoneminder/configure.sh":
    content => template("zoneminder/configure.sh.erb"),
    owner => 'root',
    group => 'root',
    mode => 0555,
    ensure => file,
    before => Exec["configure-zm"]
  }

  exec { "configure-zm":
    command => "/usr/local/src/zoneminder/configure.sh",
    cwd => "/usr/local/src/zoneminder",
    creates => "/usr/local/src/zoneminder/config.log",
    notify => Exec["make-zm"]
  }

  exec { "make-zm":
    command => "make",
    cwd => "/usr/local/src/zoneminder",
    refreshonly => true,
    notify => Exec["make-install-zm"]
  }

  exec { "make-install-zm":
    command => "make install",
    cwd => "/usr/local/src/zoneminder",
    refreshonly => true,
    notify => [ Exec["create-schema"], Exec["ldconfig"] ]
  }
}
