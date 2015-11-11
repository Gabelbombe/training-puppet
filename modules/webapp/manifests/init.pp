class webapp(
  $docroot    = $webapp::params::docroot,
  $mysqlpass  = 'oc0Ierie eip0Fuc1 Loh2ohse Thoo4lie po5maCho Kahpho4r Veeth5Nu AeNg0Quo',
) inherits webapp::params {

  include apache
  include apache::mod::php

  class { 'mysql::bindings': php_enable => true }
  class { 'mysql::server':
    root_password           => $mysqlpass,
    create_root_my_cnf      => false,
    remove_default_accounts => true,
    restart                 => true,
  }

  apache::vhost { $::fqdn:
    vhost_name    => $::fqdn,
    docroot       => $docroot,
    priority      => 10,
    port          => 80,
  }
}