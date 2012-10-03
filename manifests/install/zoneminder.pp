class zoneminder::install::zoneminder {
  exec { "clone-zoneminder":
    command => "git clone $zoneminder::params::zoneminder_source zoneminder",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/zoneminder",
    before => Exec["configure-zm"],
    require => Package["libjpeg-turbo"]
  }

  exec { "configure-zm":
    command => "/usr/local/src/zoneminder/configure $zoneminder::params::zoneminder_configure_options",
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
}
