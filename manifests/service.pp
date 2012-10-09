class zoneminder::service {

  service { 'zm':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Class['zoneminder::config'],
    subscribe => Class['zoneminder::config']
  }

  service { 'apache2':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Class['zoneminder::config'],
    subscribe => Class['zoneminder::config']
  }

}
