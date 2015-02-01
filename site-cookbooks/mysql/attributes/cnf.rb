###
# Conf Settings
###

# General
default['mysql']['cnf']['character-set-server']   = "utf8"
default['mysql']['cnf']['default-storage-engine'] = "innodb"

# Network
default['mysql']['cnf']['port']                 = 3306
default['mysql']['cnf']['max_connections']      = 300
default['mysql']['cnf']['max_user_connections'] = 0
default['mysql']['cnf']['max_connect_errors']   = 10
default['mysql']['cnf']['wait_timeout']         = 28800
default['mysql']['cnf']['interactive_timeout']  = 600
default['mysql']['cnf']['connect_timeout']      = 10
default['mysql']['cnf']['max_allowed_packet']   = 1048576

# Log
default['mysql']['cnf']['log_warnings']                  = 1
default['mysql']['cnf']['general_log']                   = 0
default['mysql']['cnf']['log-slow-admin-statements']     = 0
default['mysql']['cnf']['log-queries-not-using-indexes'] = 0
default['mysql']['cnf']['slow_query_log']                = 0
default['mysql']['cnf']['long_query_time']               = 10
default['mysql']['cnf']['slow_query_log_file']           = "/var/lib/mysql/slow_query.log"

# Memory
default['mysql']['cnf']['thread_cache_size']    = 0
default['mysql']['cnf']['table_open_cache']     = 400
default['mysql']['cnf']['max_heap_table_size']  = "16M"
default['mysql']['cnf']['sort_buffer_size']     = "2M"
default['mysql']['cnf']['read_buffer_size']     = "128K"
default['mysql']['cnf']['read_rnd_buffer_size'] = "256K"
default['mysql']['cnf']['join_buffer_size']     = "128M"
default['mysql']['cnf']['query_cache_size']     = 0
default['mysql']['cnf']['query_cache_limit']    = "1M"

# InnoDB
default['mysql']['cnf']['innodb_buffer_pool_size']     = "128M"
default['mysql']['cnf']['innodb_autoextend_increment'] = "8M"
default['mysql']['cnf']['innodb_log_file_size']        = "5M"
default['mysql']['cnf']['innodb_log_buffer_size']      = "8M"
default['mysql']['cnf']['innodb_force_recovery']       = 0
