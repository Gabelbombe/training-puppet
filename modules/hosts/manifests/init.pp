class hosts {
  @@host { $::fqdn:
    host_aliases    => [ $::hostname ],
    ip              => $::ipaddress,
    tag             =>  'classroom',
  }

  Host <<| tag == 'classroom' |>> {
    ensure => present,
    target => '/etc/hosts',
  }

  ## dont purge...
  resources { 'host': purge => false }
}


