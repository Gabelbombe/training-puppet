class webapp::wordpress(
  # if it inhereits vars
) inherits webapp {

  include webapp  class { '::wordpress': install_dir => hiera('webapp::docroot') }
}