class ordering {
  stage { 'post-run':
    require => Stage['main']
  }
  include ordering::epel
  include ordering::mysql
  notify { 'This should come after the entire MySQL class is enforced':
    require => Class['ordering::mysql'],
  }
  class { 'ordering::updatedb':
    stage => 'post-run',
  }
}