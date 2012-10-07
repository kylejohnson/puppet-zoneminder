class zoneminder::install {
  package { $zoneminder::params::prerequisites:
    ensure => installed,
    before => Class["zoneminder::install::ffmpeg"]
  }

  include zoneminder::install::ffmpeg, zoneminder::install::zoneminder  
  Class['zoneminder::install::ffmpeg'] -> Class['zoneminder::install::zoneminder']
}
