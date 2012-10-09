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
    refreshonly => true,
    path => "/sbin"
  }

  exec { "create-schema":
    command => "mysql -u root < /usr/local/src/zoneminder/db/zm_create.sql",
    cwd => "/usr/local/src/zoneminder/db",
    creates => "/var/lib/mysql/zm",
    refreshonly => true,
    notify => Exec["grant-schema-privileges"]
  }

  exec { "grant-schema-privileges":
    command => "mysql -u root -e \"grant insert,select,update,delete on zm.* to '$zoneminder::params::zoneminder_db_user'@localhost identified by '$zoneminder::params::zoneminder_db_pass'\"",
    refreshonly => true
  }

  file { "/etc/apache2/sites-enabled/000-default":
    ensure => file,
    source => "puppet:///modules/zoneminder/zoneminder",
    owner => 'root',
    group => 'root',
    mode => 0544,
    require => Package['apache2']
  }

}
