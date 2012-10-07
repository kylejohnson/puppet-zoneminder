class zoneminder::service {

  service { 'zm':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Class['zoneminder::config']
  }

}
