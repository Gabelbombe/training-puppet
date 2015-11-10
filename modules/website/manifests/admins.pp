class website::admins {
  include system::admins
  User <| tag == 'wordpress' |>
  realize User['admin']
}