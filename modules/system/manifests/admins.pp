class system::admins {
  $users = {
    'bob'   => { tag => [ 'wordpress' ] },
    'sally' => { tag => [ 'wordpress' ] },
    'joe'   => { tag => [ 'oracle'    ] },
    'admin' => {},
  }

  Users {
    ensure           => present,
    home             => '/home/jargyle',
    password         => '!!',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '501',
  }
  create_resources('users', $users)
}