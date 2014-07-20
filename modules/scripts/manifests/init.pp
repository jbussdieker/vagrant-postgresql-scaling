class scripts {

  file { '/home/vagrant/bin':
    ensure  => directory,
  }

  file { '/home/vagrant/bin/restore-database':
    ensure  => present,
    mode    => '0755',
    content => template('scripts/restore-database.erb'),
    require => File['/home/vagrant/bin'],
  }

}
