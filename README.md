# sc_redis

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sc_redis](#setup)
    * [What sc_redis affects](#what-sc_redis-affects)
    * [Beginning with sc_redis](#beginning-with-sc_redis)
4. [Usage - Configuration options and additional functionality](#usage)

## Overview

ScaleCommerce Wrapper Module for arioch-redis module. Manages Supervisord.

## Module Description

This module uses hiera to configure supervisord config for redis.

## Setup

### What sc_redis affects

* redis-server
* supervisord


### Beginning with sc_redis

You will need a working hiera-Setup (https://docs.puppetlabs.com/hiera/3.1/complete_example.html).

Check out our solultion for Puppet-Hiera-Roles (https://github.com/ScaleCommerce/puppet-hiera-roles).

## Usage:

Put this into your node.yaml or role.yaml. See [Documentation of puppetlabs-apache](https://github.com/puppetlabs/puppetlabs-apache) for details on vhost syntax.

``` 
---
classes:
  - sc_redis
  
```

