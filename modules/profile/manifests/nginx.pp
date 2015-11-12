class profile::nginx(
  $docroot = hiera('ngnix::docroot'),
  $vhost   = hiera('ngnix::hostname'),
) {

  file { $docroot: ensure => directory }

  class { 'nginx': }

  nginx::resource::vhost { $vhost:
    ensure               => present,
    server_name          => [ $vhost ],
    listen_port          => 8080,
    www_root             => $docroot,
    access_log           => '/var/log/nginx/puppet_access.log',
    error_log            => '/var/log/nginx/puppet_error.log',
  }
}