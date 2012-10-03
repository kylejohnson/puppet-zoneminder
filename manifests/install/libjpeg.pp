class zoneminder::install::libjpeg {
  exec { "get-libjpeg":
    command => "wget $zoneminder::params::libjpeg_source -O ./libjpeg-turbo-1.1.1_amd64.deb",
    cwd => "/usr/local/src",
    creates => "/usr/local/src/libjpeg-turbo-1.1.1_amd64.deb",
  }

  package { "libjpeg-turbo":
    provider => dpkg,
    ensure => installed,
    source => "/usr/local/src/libjpeg-turbo-1.1.1_amd64.deb",
    require => Exec["get-libjpeg"],
    notify => Exec["link-libjpeg"]
  }

  exec { "link-libjpeg":
    command => "ln -s /opt/libjpeg-turbo/lib/libjpeg.a /usr/lib/libjpeg.a && ln -s /opt/libjpeg-turbo/include/jconfig.h /usr/include/jconfig.h && ln -s /opt/libjpeg-turbo/include/jerror.h /usr/include/jerror.h && ln -s /opt/libjpeg-turbo/include/jmorecfg.h /usr/include/jmorecfg.h && ln -s /opt/libjpeg-turbo/include/jpeglib.h /usr/include/jpeglib.h",
    cwd => "/opt/libjpeg-turbo/lib",
    refreshonly => true
  }
}
