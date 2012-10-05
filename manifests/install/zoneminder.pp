class zoneminder::install::zoneminder {

  exec { "clone-zoneminder":
    command => "svn co $zoneminder::params::zoneminder_source zoneminder << EOF
p
EOF",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/zoneminder",
    before => File["/usr/local/src/zoneminder/configure.sh"]
  }

  file { "/usr/local/src/zoneminder/configure.sh":
    source => "puppet:///modules/zoneminder/configure.sh",
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
  }
}
