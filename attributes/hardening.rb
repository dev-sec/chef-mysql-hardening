# security options

# @see http://www.symantec.com/connect/articles/securing-mysql-step-step
# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_chroot
default['mysql']['security']['chroot']                  = nil

# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_safe-user-create
default['mysql']['security']['safe_user_create']        = 1

# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-auth
default['mysql']['security']['secure_auth']             = 1

# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_symbolic-links
default['mysql']['security']['skip_symbolic_links']     = 1

# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-file-priv
default['mysql']['security']['secure_file_priv']        = nil

# @see http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_skip-show-database
default['mysql']['security']['skip_show_database']      = 1

# @see http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_local_infile
default['mysql']['security']['local_infile']            = 0

# @see https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_allow-suspicious-udfs
default['mysql']['security']['allow-suspicious-udfs']   = 0

# @see https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_automatic_sp_privileges
default['mysql']['security']['automatic_sp_privileges']   = 0

# @see https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-file-priv
default['mysql']['security']['secure-file-priv']        = '/tmp'
