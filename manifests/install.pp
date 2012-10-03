class zoneminder::install {

  ## Zoneminder ##
  # 1) Get the tarball
  # 2) extract the tarball
  # 3) Configure source
  # 4) make the source
  # 5) install the source

  Exec {
    path => "/bin:/usr/bin:/usr/local/bin"
  }

  package { $zoneminder::params::prerequisites:
    ensure => installed,
    before => Exec["clone-source"]
  }

  exec { "clone-source":
    command => "git clone $zoneminder::params::source zoneminder",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/zoneminder",
    before => Exec["configure-zm"]
  }

  exec { "configure-zm":
    command => "/usr/local/src/zoneminder/configure $zoneminder::params::configure_options",
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
    creates => "",
  }

  ## Database ##

  ## Apache ##

}
