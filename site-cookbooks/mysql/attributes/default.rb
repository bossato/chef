###
## Install Settings
####

## Version
default['mysql']['version']   = "5.6.15-1.el6.x86_64"

## File
default['mysql']['file_name']  = "MySQL-#{default['mysql']['version']}.rpm-bundle.tar"
default['mysql']['remote_uri'] = "http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/#{default['mysql']['file_name']}"
default['mysql']['rpm']        = [
  {
    :rpm_file     => "MySQL-client-#{default['mysql']['version']}.rpm",
    :package_name => "MySQL-client"
  },
  {
    :rpm_file     => "MySQL-devel-#{default['mysql']['version']}.rpm",
    :package_name => "MySQL-devel"
  },
  {
    :rpm_file     => "MySQL-server-#{default['mysql']['version']}.rpm",
    :package_name => "MySQL-server"
  },
  {
    :rpm_file     => "MySQL-shared-compat-#{default['mysql']['version']}.rpm",
    :package_name => "MySQL-shared"
  },
  {
    :rpm_file     => "MySQL-shared-#{default['mysql']['version']}.rpm",
    :package_name => "MySQL-shared"
  }
]

## Directory
default['mysql']['src_dir'] = "/usr/local/src/"

## User
default['mysql']['install_user']  = "root"
default['mysql']['install_group'] = "root"



###
# Conf Settings
###

# General
default['mysql']['character-set-server']   = "utf8"
default['mysql']['default-storage-engine'] = "innodb"

# Network
default['mysql']['port']                 = 3306
default['mysql']['max_connections']      = 300
default['mysql']['max_user_connections'] = 0
default['mysql']['max_connect_errors']   = 10
default['mysql']['wait_timeout']         = 28800
default['mysql']['interactive_timeout']  = 600
default['mysql']['connect_timeout']      = 10
default['mysql']['max_allowed_packet']   = 1048576

# Log
default['mysql']['log_warnings']                  = 1
default['mysql']['general_log']                   = 0
default['mysql']['log-slow-admin-statements']     = 0
default['mysql']['log-queries-not-using-indexes'] = 0
default['mysql']['slow_query_log']                = 0
default['mysql']['long_query_time']               = 10
default['mysql']['slow_query_log_file']           = "/var/lib/mysql/slow_query.log"

# Memory
default['mysql']['thread_cache_size']    = 0
default['mysql']['table_open_cache']     = 400
default['mysql']['max_heap_table_size']  = "16M"
default['mysql']['sort_buffer_size']     = "2M"
default['mysql']['read_buffer_size']     = "128K"
default['mysql']['read_rnd_buffer_size'] = "256K"
default['mysql']['join_buffer_size']     = "128M"
default['mysql']['query_cache_size']     = 0
default['mysql']['query_cache_limit']    = "1M"

# InnoDB
default['mysql']['innodb_buffer_pool_size']     = "128M"
default['mysql']['innodb_autoextend_increment'] = "8M"
default['mysql']['innodb_log_file_size']        = "5M"
default['mysql']['innodb_log_buffer_size']      = "8M"
default['mysql']['innodb_force_recovery']       = 0
