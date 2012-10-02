class zoneminder::install {

  ## Zoneminder ##
  # 1) Get the tarball
  # 2) extract the tarball
  # 3) Configure source
  # 4) make the source
  # 5) install the source

  package { "$zoneminder::params::prerequisites":
    ensure => installed,
    before => File['/usr/local/src/zoneminder']
  }

  file { "/usr/local/src/zoneminder":
    ensure => directory,
    owner => 'root',
    group => 'root',
    before => Exec["clone-source"]
  }

  exec { "clone-source":
    command => "git clone $zoneminder::params::source zoneminder",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/zoneminder",
    before => Exec["configure-zm"]
  }

  exec { "configure-zm":
    command => "./configure $zoneminder::params::configure_options",
    cwd => "/usr/local/src/zoneminder",
    creates => "/usr/local/src/zoneminder/config.log",
    before => Exec["make-zm"]
  }

  exec { "make-zm":
    command => "make",
    cwd => "/usr/local/src/zoneminder",
    creates => "",
    before => Exec["make-install-zm"]
  }

  exec { "make-install-zm":
    command => "make install",
    cwd => "/usr/local/src/zoneminder",
    creates => ""
  }


  ## Database ##

  ## Apache ##

}
