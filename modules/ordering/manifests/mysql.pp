class ordering::mysql {

  class { '::mysql::server':
    root_password => '4!;?:^M]A{}1wE|#{ _|.G}"~B%<?Vph',
  } ->
  class { '::mysql::bindings':
    php_enable    => true,
    perl_enable   => true,
  } ->
  anchor { 'mysql::end': }


## old
#  anchor { 'ordering::mysql::begin': }
#  ->
#
#  class { '::mysql::server':
#    root_password => '4!;?:^M]A{}1wE|#{ _|.G}"~B%<?Vph', }
#  ->
#
#  anchor { 'ordering::mysql::end': }
#
#  class { 'mysql::bindings':
#    php_enable    => true,
#    perl_enable   => true,
#  }
}