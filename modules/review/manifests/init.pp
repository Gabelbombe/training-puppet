class review(
  $user = 'review'
) {
  file { '/etc/shells':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/review/shells',
  }

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('review/motd.erb'),
  }

  user { $user:
    ensure      => present,
    shell       => '/bin/bash',
    managehome  => true,
  }
}

