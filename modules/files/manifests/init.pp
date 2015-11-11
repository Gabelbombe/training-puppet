class files {
  $motd = '/etc/motd'

  file { '/etc/cron.allow': ensure  => file }

  file_line { 'prevent cron jobs':
    path => '/etc/cron.deny',
    ensure => present,
    line => '*',
  }

  file_line { 'allow from root':
    path => '/etc/cron.allow',
    ensure => present,
    line => 'root',
  }

  concat { $motd:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  concat::fragment { 'motd header':
    content => template('files/header.erb'),
    target => $motd,
    order => 1,
  }

  concat::fragment { 'motd footer':
    content => template('files/footer.erb'),
    target => $motd,
    order => 999,
  }
}
