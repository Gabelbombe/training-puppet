class ordering::mysql {

  anchor { 'ordering::mysql::begin': }
  ->

  class { '::mysql::server':
    root_password => '4!;?:^M]A{}1wE|#{ _|.G}"~B%<?Vph', }
  ->

  anchor { 'ordering::mysql::end': }

  class { 'mysql::bindings':
    php_enable    => true,
    perl_enable   => true,
  }

  #contain mysql::bindings
  # If you didn't want to use anchors, you could also call the contain()
  # function like this. Like the include() function, it is idempotent, so
  # the fact that we have declared it above is not a problem. That *would* be
  # parse order dependent though. If we were to put the contain() function
  # before the class declaration, the compile would fail with a duplicate
  # resource declaration error. #
  # contain mysql::server
}