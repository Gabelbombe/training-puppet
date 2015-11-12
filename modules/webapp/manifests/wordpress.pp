class role::wordpress {

  include webapp  class { '::wordpress': install_dir => hiera('webapp::docroot') }
}