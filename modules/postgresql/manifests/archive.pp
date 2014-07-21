class postgresql::archive($location) {

  file { $location:
    ensure  => directory,
    owner   => 'postgres',
    group   => 'postgres',
    require => Package['postgresql'],
    before  => Service['postgresql'],
  }

}
