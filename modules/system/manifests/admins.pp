class system::admins {
  $users = {
    'bob'   => { tag => [ 'wordpress' ] },
    'sally' => { tag => [ 'wordpress' ] },
    'joe'   => { tag => [ 'oracle'    ] },
    'admin' => {},
  }
  User {
    ensure      => present,
    managehome  => true,
    shell       => '/bin/bash',
  }
  create_resources('user', $users)
}