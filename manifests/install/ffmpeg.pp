class zoneminder::install::ffmpeg {
  exec { "clone-ffmpeg":
    command => "git clone $zoneminder::params::ffmpeg_source ffmpeg",
    cwd => "/usr/local/src",
    timeout => 600,
    creates => "/usr/local/src/ffmpeg",
    before => Exec["configure-ffmpeg"]
  }

  exec { "configure-ffmpeg":
    command => "/usr/local/src/ffmpeg/configure $zoneminder::params::ffmpeg_configure_options",
    cwd => "/usr/local/src/ffmpeg",
    creates => "/usr/local/src/ffmpeg/config.log",
    notify => Exec["make-ffmpeg"]
  }

  exec { "make-ffmpeg":
    command => "make -j `grep processor /proc/cpuinfo|wc -l`",
    cwd => "/usr/local/src/ffmpeg",
    timeout => 0,
    refreshonly => true,
    notify => Exec["make-install-ffmpeg"]
  }

  exec { "make-install-ffmpeg":
    command => "make install",
    cwd => "/usr/local/src/ffmpeg",
    refreshonly => true,
    notify => Exec["make-install-libs-ffmpeg"]
  }

  exec { "make-install-libs-ffmpeg":
    command => "make install-libs",
    cwd => "/usr/local/src/ffmpeg",
    refreshonly => true,
  }
}
