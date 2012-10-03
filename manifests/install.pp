class zoneminder::install {

  Exec {
    path => "/bin:/usr/bin:/usr/local/bin"
  }

  package { $zoneminder::params::prerequisites:
    ensure => installed,
    before => Exec["clone-ffmpeg"],
  }

  include zoneminder::install::ffmpeg, zoneminder::install::libjpeg, zoneminder::install::zoneminder  
  Class['zoneminder::install::ffmpeg'] -> Class['zoneminder::install::libjpeg'] -> Class['zoneminder::install::zoneminder']
}
