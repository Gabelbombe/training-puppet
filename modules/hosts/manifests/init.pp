class hosts {

#  $hosts = {
#    'master.puppetlabs.vm'  => {
#      host_aliases => ['master'],
#      ip           => '10.0.20.3',
#    },
#    'localhost'             => {
#      host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
#      ip           => '::1',
#    },
#    'student.puppetlabs.vm' => {
#      host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
#      ip           => '127.0.0.1',
#    },
#
#    $::fqdn   => {
#      host_aliases => [$::hostname],
#      ip           => $::ipaddress,       ## '10.0.2.15',
#    },
#  }

  @@host { $::fqdn:
    host_aliases    => [ $::hostname ],
    ip              => $::ipaddress,
    tag             =>  'classroom',
  }

  Host <<| tag == 'classroom' |>> {
    ensure => present,
    target => '/etc/hosts',
  }

#  create_resources( 'host', $hosts )
}


