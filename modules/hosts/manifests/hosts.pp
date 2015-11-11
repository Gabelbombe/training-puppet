class hosts {
  # create a virtual host resource based on known information
  # and export it back to the Puppet Master
  @@host { $::hostname:
    ip           => $::ipaddress,
    host_aliases => $::fqdn,
  }

  # collect all exported resources and realize them on this host
  Host <<||>>

  # ensure that we have no host entries that aren't explicitly configured
  resources { 'host':
    purge  => true,
  }
}