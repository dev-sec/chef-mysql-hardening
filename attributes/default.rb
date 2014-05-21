include_attribute 'mysql'

# ensure the following parameters are set properly
default['mysql']['allow_remote_root'] = false
default['mysql']['remove_anonymous_users'] = true
default['mysql']['remove_test_database'] = true
