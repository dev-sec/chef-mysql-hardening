# mysql-hardening (Chef cookbook)

## Description

Provides security configurations for mysql.

Note: This is currently work in progress and not tested on all supported platforms

## Requirements

* Opscode chef

## Usage

This cookbook is optimized to work with [os-hardening](https://github.com/TelekomLabs/chef-os-hardening) and [ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening). It will play well without, but you need to ensure all preconditions like `apt-get update` or `yum update` are met.

tbd.

## Security Options

Further information is already available at [Deutsche Telekom (German)](http://www.telekom.com/static/-/155996/7/technische-sicherheitsanforderungen-si) and [Symantec](http://www.symantec.com/connect/articles/securing-mysql-step-step) 

 * default['mysql']['security']['chroot'] - [chroot](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_chroot)
 * default['mysql']['security']['safe_user_create'] - [safe-user-create](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_safe-user-create)
 * default['mysql']['security']['secure_auth'] - [secure-auth](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-auth)
 * default['mysql']['security']['skip_symbolic_links'] - [skip-symbolic-links](http://dev.mysql.com/doc/refman/5.7/en/server-
    options.html#option_mysqld_symbolic-links)
 * default['mysql']['security']['skip_show_database'] - [skip-show-database](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_skip-show-database)
 * default['mysql']['security']['local_infile'] - [local-infile](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_local_infile)

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

    automatic_sp_privileges = 0
    secure-file-priv = /tmp


Additionally it ensures that the following parameters are not set

 * old-passwords via `['mysql']['security']['secure_auth']`
 * allow-suspicious-udfs
 * skip-grant-tables
 * chroot (instead we prefer AppArmor for Ubuntu)

Furthermore the permission of `/var/lib/mysql` is limited to `mysql` user.

## Tests

    # fast test on one machine
    kitchen test default-ubuntu-1204

    # test on all machines
    kitchen test

    # for development
    kitchen create default-ubuntu-1204
    kitchen converge default-ubuntu-1204


## Contributors + Kudos

* Dominik Richter
* Christoph Hartmann
* Patrick Meier

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
