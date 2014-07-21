class postgresql(
  $listen_addresses = undef,
  $wal_level = undef,
  $archive_mode = undef,
  $archive_command = undef,
  $max_wal_senders = undef,
  $hot_standby = undef,
) {

  $config_dir = '/etc/postgresql/9.3/main'

  File {
    require => Package['postgresql'],
    notify  => Service['postgresql'],
  }

  package { 'postgresql': }

  file { "${config_dir}/pg_hba.conf":
    ensure  => present,
    content => template('postgresql/pg_hba.conf.erb'),
  }

  file { "${config_dir}/pg_ctl.conf":
    ensure  => present,
    content => template('postgresql/pg_ctl.conf.erb'),
  }

  file { "${config_dir}/pg_ident.conf":
    ensure  => present,
    content => template('postgresql/pg_ident.conf.erb'),
  }

  file { "${config_dir}/postgresql.conf":
    ensure  => present,
    content => template('postgresql/postgresql.conf.erb'),
  }

  service { 'postgresql':
    require => Package['postgresql'],
  }

}
