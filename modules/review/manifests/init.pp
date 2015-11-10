class review (
  $user = 'review'
) {
  file { '/etc/shells':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/review/shells',
  }

#  file { '/etc/motd':
#    ensure  => file,
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0644',
#    content => template('review/motd.erb'),
#  }

  file { '/usr/local/bin/dynmotd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('review/motd.erb'),
  }

  file_line { '/pam/login':
     path   => '/etc/pam.d/login',
     line   => 'session    optional     pam_motd.so',
  }

  file_line { '/etc/profile':
    path  => '/etc/profile',
    line  => 'sh /usr/local/bin/dynmotd >| /etc/motd',
  }

  user { $user:
    ensure      => present,
    shell       => '/bin/bash',
    managehome  => true,
    require     => File['/etc/shells']
  }
}

