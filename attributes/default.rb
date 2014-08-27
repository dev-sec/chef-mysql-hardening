# encoding: utf-8
#
# Cookbook Name:: mysql-hardening
# Attributes:: default
#
# Copyright 2014, Christoph Hartmann
# Copyright 2014, Deutsche Telekom AG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_attribute 'mysql'

# ensure the following parameters are set properly
default['mysql']['allow_remote_root'] = false
default['mysql']['remove_anonymous_users'] = true
default['mysql']['remove_test_database'] = true

# path configuration
default['mysql-hardening']['user'] = 'mysql'

case platform_family
when 'rhel', 'fedora'
  default['mysql-hardening']['mysql-conf'] = '/etc/my.cnf'
else
  default['mysql-hardening']['mysql-conf'] = '/etc/mysql/my.cnf'
end

default['mysql-hardening']['hardening-conf'] = '/etc/mysql/conf.d/hardening.cnf'
