class zoneminder::service {

  service { 'zm':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => File['/etc/rc.d/zm']
  }

}
