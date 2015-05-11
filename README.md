# mysql-hardening (Chef cookbook)

[![Supermarket](http://img.shields.io/cookbook/v/mysql-hardening.svg)][1]
[![Build Status](http://img.shields.io/travis/hardening-io/chef-mysql-hardening.svg)][2]
[![Code Coverage](http://img.shields.io/coveralls/hardening-io/chef-mysql-hardening.svg)][3]
[![Dependencies](http://img.shields.io/gemnasium/hardening-io/chef-mysql-hardening.svg)][4]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][5]

## Description

Provides security configurations for mysql. It is intended to set up production-ready mysql instances that are configured with minimal surface for attackers.

This cookbook focus security configuration of mysql and reuses the [mysql cookbook](https://github.com/opscode-cookbooks/mysql) for the installation. Therefore you can add this hardening layer on top of your existing mysql configuration in Chef.

We optimized this cookbook to work with [os-hardening](https://github.com/TelekomLabs/chef-os-hardening) and [ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening) without a hassle. It will play well without, but you need to ensure all preconditions like `apt-get update` or `yum update` are met.

## Requirements

* Opscode chef

## Usage

A sample role may look like:

```json
{
    "name": "mysql",
    "default_attributes": { },
    "override_attributes": { },
    "json_class": "Chef::Role",
    "description": "MySql Hardened Server Test Role",
    "chef_type": "role",
    "default_attributes" : {
      "mysql": {
        "server_root_password": "iloverandompasswordsbutthiswilldo",
        "server_debian_password": "iloverandompasswordsbutthiswilldo"
      }
    },
    "run_list": [
        "recipe[chef-solo-search]",
        "recipe[apt]",
        "recipe[mysql::server]",
        "recipe[mysql-hardening]"
    ]
}
```

## Recipes

### mysql-hardening::hardening (default)

This recipe is an overley recipe for the [mysql cookbook](https://github.com/opscode-cookbooks/mysql)) and applies `mysql-hardening::hardening`

Add the following to your runlist and customize security option attributes

```bash
  "recipe[mysql::server]",
  "recipe[mysql-hardening]"
```

This hardening recipe installs the hardening but expects an existing installation of Mysql, MariaDB or Percona. If you are not using the mysql cookbook, you may need to adapt the attributes:

- `node['mysql']['service_name']` = 'default'
- `node['mysql']['data_dir']` = '/var/lib/mysql'
- `node['mysql-hardening']['conf-file'] = '/etc/mysql/conf.d/hardening.cnf'` 
- `node['mysql-hardening']['user'] = 'mysql'`

## Security Options

Further information is already available at [Deutsche Telekom (German)](http://www.telekom.com/static/-/155996/7/technische-sicherheitsanforderungen-si) and [Symantec](http://www.symantec.com/connect/articles/securing-mysql-step-step) 

 * default['mysql']['security']['chroot'] - [chroot](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_chroot)
 * default['mysql']['security']['safe_user_create'] - [safe-user-create](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_safe-user-create)
 * default['mysql']['security']['secure_auth'] - [secure-auth](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-auth)
 * default['mysql']['security']['skip_symbolic_links'] - [skip-symbolic-links](http://dev.mysql.com/doc/refman/5.7/en/server-
    options.html#option_mysqld_symbolic-links)
 * default['mysql']['security']['skip_show_database'] - [skip-show-database](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_skip-show-database)
 * default['mysql']['security']['local_infile'] - [local-infile](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_local_infile)
 * default['mysql']['security']['allow-suspicious-udfs'] - [allow-suspicious-udfs](https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_allow-suspicious-udfs)
 * default['mysql']['security']['automatic_sp_privileges'] - [automatic_sp_privileges](https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_automatic_sp_privileges)
 * default['mysql']['security']['secure-file-priv'] - [secure-file-priv](https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-file-priv)

## Security Configuration

This setup sets the following parameters by default

    user = mysql
    port = 3306
    bind-address = X.Y.Z.W

    # via ['mysql']['security']['local_infile']
    local-infile = 0

    # via ['mysql']['security']['safe_user_create']
    safe-user-create = 1

    # via ['mysql']['security']['secure_auth']
    secure-auth = 1

    # via ['mysql']['security']['skip_show_database']
    skip-show-database

    # via ['mysql']['security']['skip_symbolic_links']
    skip-symbolic-links

    # via ['mysql']['security']['automatic_sp_privileges']
    automatic_sp_privileges = 0

    # via ['mysql']['security']['secure-file-priv']
    secure-file-priv = /tmp


Additionally it ensures that the following parameters are not set

 * deactivate old-passwords via `['mysql']['security']['secure_auth']`
 * deactivate allow-suspicious-udfs via `node['mysql']['security']['allow-suspicious-udfs']`
 * skip-grant-tables
 * chroot (instead we prefer AppArmor for Ubuntu)

Furthermore the permission of `/var/lib/mysql` is limited to `mysql` user.

## Tests

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

This cookbook comes with a [guard](https://github.com/guard/guard) file for easy development. During development guard watches the folders and runs footcritic and robocop.

```
# list all plugins
bundle exec guard list

# run guard with foodcritic and robocop
bundle exec guard -P Foodcritic Rubocop
```

## Tested Operating Systems

* Ubuntu 12.04
* Ubuntu 14.04
* CentOS 6.4
* CentOS 6.5
* Oracle 6.4
* Oracle 6.5
* Debian 7

## Contributors + Kudos

* Dominik Richter
* Christoph Hartmann
* Patrick Meier
* Edmund Haselwanter

## License and Author

* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://supermarket.getchef.com/cookbooks/mysql-hardening
[2]: http://travis-ci.org/hardening-io/chef-mysql-hardening
[3]: https://coveralls.io/r/hardening-io/chef-mysql-hardening
[4]: https://gemnasium.com/hardening-io/chef-mysql-hardening
[5]: https://gitter.im/hardening-io/general
