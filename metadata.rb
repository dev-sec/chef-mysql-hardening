# encoding: utf-8
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

name             "mysql-hardening"
maintainer       "Christoph Hartmann"
maintainer_email "chris@lollyrock.com"
license          "Apache v2.0"
description      "Installs and configures a secure mysql server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.0"

depends 'mysql' , "~>5.0"

recipe 'mysql-hardening::default', 'installs a hardened mysql server'
recipe 'mysql-hardening::server', 'installs a hardened mysql server'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'debian'
supports 'ubuntu'