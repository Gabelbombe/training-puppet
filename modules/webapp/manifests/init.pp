class webapp($docroot = $webapp::params::docroot) inherits webapp::params {
  include apache
  include apache::mod::php
  include mysql::server

  class { 'mysql::bindings': php_enable => true }

  apache::vhost { $::fqdn:
    vhost_name    => $::fqdn,
    docroot       => $docroot,
    priority      => 10,
    port          => 80,
  }
}