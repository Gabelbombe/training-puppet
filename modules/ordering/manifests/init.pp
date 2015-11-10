class ordering {
  stage { 'post-run': }
  Stage['main'] -> Stage['post-run']

  class {'ordering::updatedb': stage => 'post-run', }

  include ordering::epel
  include ordering::mysql

  notify { 'Should come after mysql':
    require => Class['ordering::mysql']
  }
}