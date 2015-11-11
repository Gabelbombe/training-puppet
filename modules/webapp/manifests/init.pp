class webapp (
  $docroot    = hiera('webapp::docroot', $webapp::params::docroot), ## look up in hiera first or dfault to params
  $mysqlpass  = 'oc0Ierie eip0Fuc1 Loh2ohse Thoo4lie po5maCho Kahpho4r Veeth5Nu AeNg0Quo',
) inherits webapp::params {

  include apache
  include apache::mod::php

  class { 'mysql::bindings': php_enable => true }
  class { 'mysql::server':
    root_password           => $mysqlpass,
    restart                 => true,
  }

  apache::vhost { $::fqdn:
    vhost_name    => $::fqdn,
    docroot       => $docroot,
    priority      => 10,
    port          => 80,
  }
}