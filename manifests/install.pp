class zoneminder::install {

  Exec {
    path => "/bin:/usr/bin:/usr/local/bin"
  }

  package { $zoneminder::params::prerequisites:
    ensure => installed,
    before => Exec["clone-ffmpeg"],
  }
  
  Class['zoneminder::install::ffmpeg'] -> Class['zoneminder::install::libjpeg'] -> Class['zoneminder::install::zoneminder']
}
