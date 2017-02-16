class sc_redis (
  $supervisor_init_script = '/etc/supervisor.init/supervisor-init-wrapper',
  $supervisor_conf_script = '/etc/supervisor.d/redis.conf',
  $supervisor_exec_path   = '/usr/local/bin',
) {

  include redis

  # supervisor
  file { '/etc/init.d/redis-server':
    ensure => link,
    target => $supervisor_init_script,
  }

  file { $supervisor_conf_script:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/redis-server.supervisor.conf.erb"),
    notify  => Exec['supervisorctl_redis_update'],
  }

  exec {'supervisorctl_redis_update':
    command     => "${supervisor_exec_path}/supervisorctl update",
    refreshonly => true,
  }
}