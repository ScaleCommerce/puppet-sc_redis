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
  $use_supervisor = true,
) {

  include sc_supervisor
  include redis

  if $use_supervisor {
    class {'::sc_redis::supervisor':}
  }


  Class['apt::update'] -> Package[redis-server]
}
