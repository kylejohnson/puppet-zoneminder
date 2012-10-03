class zoneminder::config {

  file { "/etc/init.d/zm":
    source => "puppet:///modules/zoneminder/zm",
    owner => 'root',
    group => 'root',
    mode => '0550',
    require => Class["zoneminder::install"]
  }

  file { "/var/www/zm":
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
    require => Class["zoneminder::install"]
  }

  file { "/etc/ld.so.conf.d/zoneminder.conf":
    ensure => file,
    source => "puppet:///modules/zoneminder/zoneminder.conf",
    owner => 'root',
    group => 'root',
    mode => 0444,
    before => Class["zoneminder::install"],
    notify => Exec["ldconfig"]
  }

  exec { "ldconfig":
    refreshonly => true
  }

}
