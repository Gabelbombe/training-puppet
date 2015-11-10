class system::dbadmins {
  require mysql::server

  $users = ['zack@localhost', 'monica@localhost', 'luke@localhost']

  Mysql_user { 
    ensure => present,
    password_hash => mysql_password('puppetlabs'),
    
  }

  mysql_user { $users:
  }

  mysql_user { 'ralph@localhost':
    ensure        => absent,
  }

  mysql_user { 'brad@localhost':
    password_hash => mysql_password('puppet'),
  }
}
