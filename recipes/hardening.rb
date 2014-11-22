# encoding: utf-8
#
# Cookbook Name: mysql-hardening
# Recipe: hardening.rb
#
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

# protect my.cnf
file node['mysql-hardening']['mysql-conf'] do
  mode '600'
  owner 'root'
  group 'root'
end

# apply hardening configuration
template node['mysql-hardening']['hardening-conf'] do
  owner node['mysql-hardening']['user']
  mode '750'
  source 'hardening.cnf.erb'
  notifies :restart, "mysql_service[#{node['mysql']['service_name']}]"
end

# ensure permissions
directory node['mysql']['data_dir'] do
  mode '755'
  owner node['mysql-hardening']['user']
  action :create
end
