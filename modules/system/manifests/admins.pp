class system::admins {
  User { ensure => present, }

  @user { ['bob', 'sally']:
    tag => 'wordpress',
  }

  @user { 'joe':
    tag => 'oracle',
  }

  @user { 'admin': }
}