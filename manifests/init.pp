# == Class: sc_redis
#
# ScaleCommerce Wrapper Module for arioch-redis.
# Manages Supervisord.
#
# === Variables
#
# [*supervisor_init_script*]
#  full path to supervisor init wrapper script
#
# [*supervisor_conf_script*
#  full path to supervisor conf script
#
# [*supervisor_exec_path*]
#  path to supervisor executable
#
# === Authors
#
# Andreas Ziethen <az@scale.sc>
#
# === Copyright
#
# Copyright 2017 ScaleCommerce GmbH.
#

class sc_redis (
  $supervisor_exec_path   = '/usr/local/bin',
) {

  include sc_supervisor
  include redis

  # supervisor
  file { '/etc/init.d/redis-server':
    ensure => link,
    target => "${sc_supervisor::init_path}/supervisor-init-wrapper",
  }

  file { '/var/run/redis':
    ensure => directory,
    owner  => 'redis',
    group  => 'redis'
  }->

  file { '/var/log/redis/error.log':
    owner => 'redis',
    group => 'redis',
  }->

  file { '/var/log/redis/redis.log':
    owner => 'redis',
    group => 'redis',
  }->

  file { "${supervisord::config_include}/redis-server.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/redis-server.supervisor.conf.erb"),
    notify  => Class[supervisord::reload],
  }
  
  exec {'supervisorctl_redis_update':
    command     => "${supervisor_exec_path}/supervisorctl update",
    refreshonly => true,
  }

}
