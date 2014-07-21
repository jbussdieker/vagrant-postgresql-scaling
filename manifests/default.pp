file { '/mnt/archive':
  ensure  => directory,
  owner   => 'postgres',
  group   => 'postgres',
  require => Package['postgresql'],
}

class { 'postgresql':
  listen_addresses             => '*',
  wal_level                    => 'hot_standby',
  archive_mode                 => 'on',
  archive_command              => 'test ! -f /mnt/archive/%f && cp %p /mnt/archive/%f',
  max_wal_senders              => '5',
  wal_keep_segments            => '16',
  hot_standby                  => 'on',
  wal_receiver_status_interval => '10s',
}

if $hostname != "db1" {

  class { 'scripts':
  }

  exec { "/home/vagrant/bin/restore-database 10.0.255.3 && /usr/bin/touch /var/tmp/database-restored":
    creates   => '/var/tmp/database-restored',
    tries     => 20,
    try_sleep => 5,
    require   => [
      Class['postgresql'],
      Class['scripts'],
    ],
  }
}
