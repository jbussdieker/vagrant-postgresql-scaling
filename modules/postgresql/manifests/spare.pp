class postgresql::spare($stage = 'deploy', $master) {

  file { '/usr/bin/dbsync':
    ensure  => present,
    mode    => '0755',
    content => template("postgresql/spare/dbsync.erb"),
    notify  => Exec['postgresql_spare_sync'],
  }

  exec { 'postgresql_spare_sync':
    command     => '/usr/bin/dbsync',
    creates     => '/var/run/dbsync_complete',
    refreshonly => true,
    tries       => 20,
    try_sleep   => 5,
  }

}
