class system::hosts {
  resources { 'host':
    purge => true,                       ## this is a horrible fucking idea....
  }
  $hosts = {
    'localhost'             => {
      host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
      ip           => '::1',
    },
    'master.puppetlabs.vm'  => {
      host_aliases => ['master'],
      ip           => '10.0.20.3',
    },
    'student.puppetlabs.vm' => {
      host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
      ip           => '127.0.0.1',
    },
    'troll.puppetlabs.vm'   => {
      host_aliases => ['troll'],
      ip           => $::ipaddress,       ## '10.0.2.15',
    },
  }
  Hosts {
    ensure => present,
    target => '/etc/hosts',
  }
  create_resources( 'host', $hosts )
}