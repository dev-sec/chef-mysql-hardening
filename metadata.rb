name             "mysql-hardening"
maintainer       "Christoph Hartmann"
maintainer_email "chris@lollyrock.com"
license          "Apache v2.0"
description      "Installs and configures a secure mysql server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'mysql' , "> 5.2.0"
depends 'apt'
depends 'yum'

recipe 'mysql-hardening::default', 'installs a hardened mysql server'
recipe 'mysql-hardening::server', 'installs a hardened mysql server'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'debian'
supports 'ubuntu'