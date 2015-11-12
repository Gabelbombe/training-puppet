class webapp::params {
  case $::osfamily {

    'RedHat': { $docroot = '/var/www/html' }
    'Debian': { $docroot = '/var/www'      }

    default: {
      fail("Module is not supported on ${::osfamily}")
    }

  }
}