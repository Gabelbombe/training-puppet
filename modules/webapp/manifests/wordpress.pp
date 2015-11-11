class role::wordpress {
  include profile::wordpress
  include profile::security::base
  include profile::security::web_app
  include profile::base::linux
}