class webapp::params {
  case $::osfamily {
    'RedHat': {
      $docroot = '/var/www/html'
    }

    'Debian': {
      $docroot = '/var/www'
    }

    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }

  }
}