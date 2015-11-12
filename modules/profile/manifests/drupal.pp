class profile::drupal(
  $mysqluser  = hiera('mysql::user'),
  $mysqlpass  = hiera('mysql::pass'),
  $mysqlname  = hiera('mysql::name'),
) {

  class { 'mysql::bindings': php_enable => true }
  class { 'mysql::server':
    root_password => $mysqlpass,
    restart       => true,
  }

  class { 'drupal':
    installtype    => 'remote',
    database       => $mysqlname,
    dbuser         => $mysqluser,
  }
}