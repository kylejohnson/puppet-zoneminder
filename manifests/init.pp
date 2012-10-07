class zoneminder {
  Exec {
    path => "/bin:/usr/bin:/usr/local/bin"
  }
  include zoneminder::params, zoneminder::install, zoneminder::config, zoneminder::service
}
