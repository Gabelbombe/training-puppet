class hosts {
  @@host { $::fqdn:
    host_aliases    => [ $::hostname ],
    ip              => $::ipaddress,
    tag             =>  'classroom',
  }

  Host <<| tag == 'classroom' |>> {
    ensure          => present,
    target          => '/etc/hosts',
  }

  resources { 'host': purge => false }  ## dont purge...
}