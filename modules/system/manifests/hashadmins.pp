class system::hashadmins {
  require mysql::server
  
  $users = {
    'zack@localhost'    => {},
    'monica@localhost'  => {}, 
    'luke@localhost'    => {}, 
    'ralph@localhost'   => { ensure => absent },
    'brad@localhost'    => { password_hash => mysql_password('puppet') }
  }
  Mysql_user {
    ensure => present,
    password_hash => mysql_password('puppetlabs'),

  }
  create_resources('mysql_user', $users)
}
