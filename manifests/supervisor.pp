

class sc_redis::supervisor(

){
  include supervisord

  # supervisor
  file { '/etc/init.d/redis-server':
    ensure => link,
    target => "${sc_supervisor::init_path}/supervisor-init-wrapper",
  }

  exec {'supervisorctl_redis_update':
    command     => "${supervisor_exec_path}/supervisorctl update",
    refreshonly => true,
  }

  supervisord::program { 'redis-server':
    command     => '/usr/bin/redis-server /etc/redis/redis.conf',
    autostart   => true,
    autorestart => true,
    user => 'redis',
    require      => Package['redis-server'],
  }
}