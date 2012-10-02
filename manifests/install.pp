class zoneminder::install {

  ## Zoneminder ##
  # 1) Get the tarball
  # 2) extract the tarball
  # 3) Configure source
  # 4) make the source
  # 5) install the source

  package { "$zoneminder::params::prerequisites":
    ensure => installed,
    before => File['/usr/local/src/ZoneMinder-1.25.0.tar.gz']
  }

  file { "/usr/local/src/ZoneMinder-1.25.0.tar.gz":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0550',
    source => "puppet:///modules/zoneminder/ZoneMinder-1.25.0.tar.gz",
    before => Exec["untar-zm"]
  }

  exec { "untar-zm":
    command => "tar -xf /usr/local/src/ZoneMinder-1.25.0.tar.gz",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/ZoneMinder-1.25.0",
    before => Exec["configure-zm"]
  }

  exec { "configure-zm":
    command => "./configure $zoneminder::params::configure_options",
    cwd => "/usr/local/src/ZoneMinder-1.25.0",
    creates => "/usr/local/src/ZoneMinder-1.25.0/config.log",
    before => Exec["make-zm"]
  }

  exec { "make-zm":
    command => "make",
    cwd => "/usr/local/src/ZoneMinder-1.25.0",
    creates => "",
    before => Exec["make-install-zm"]
  }

  exec { "make-install-zm":
    command => "make install",
    cwd => "/usr/local/src/ZoneMinder.1.25.0",
    creates => ""
  }


  ## Database ##

  ## Apache ##

}
