class ordering {
  stage { 'post-run': }
  Stage['main'] -> Stage['post-run']

  class {'ordering::updatedb': stage => 'post-run', }

  notify { 'Should come after mysql':
    require => Class['ordering::mysql']
  }

  include ordering::epel
  include ordering::mysql
}