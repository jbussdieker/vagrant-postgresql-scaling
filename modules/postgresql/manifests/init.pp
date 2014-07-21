class postgresql(
  $listen_addresses = undef,
  $wal_level = undef,
  $archive_mode = undef,
  $archive_command = undef,
  $archive_path = undef,
  $max_wal_senders = undef,
  $hot_standby = undef,
) {

  package { 'postgresql':
    ensure => present,
    notify => Service['postgresql'],
  }
->
  file { '/etc/postgresql/9.3/main/pg_hba.conf':
    ensure  => present,
    content => template('postgresql/pg_hba.conf.erb'),
    notify  => Service['postgresql'],
  }
->
  file { '/etc/postgresql/9.3/main/postgresql.conf':
    ensure  => present,
    content => template('postgresql/postgresql.conf.erb'),
    notify  => Service['postgresql'],
  }
->
  service { 'postgresql':
    ensure   => running,
    loglevel => debug,
  }

}
