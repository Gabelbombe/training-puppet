class webapp::wordpress inherits webapp {
  include webapp

  class { '::wordpress': install_dir => $webapp::docroot }
}