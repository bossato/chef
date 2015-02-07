###
# Conf Settings
###

# General
default['apache']['port']            = 80
default['apache']['port_ssl']        = 443
default['apache']['directory_index'] = "index.php index.html"

# User
default['apache']['user']         = "www"
default['apache']['group']        = "www"
default['apache']['server_admin'] = "you@example.com"

# Server
default['apache']['server_name']   = "locaohost"
default['apache']['document_root'] = "/usr/local/apache2/htdocs"

# Logs
default['apache']['access_log'] = "#{default['apache']['dir']}/logs/access_log"
default['apache']['error_log']  = "#{default['apache']['dir']}/logs/error_log"

# Prefork
default['apache']['prefork']['start_servers']         = 5
default['apache']['prefork']['min_spare_servers']     = 5
default['apache']['prefork']['max_spare_servers']     = 10
default['apache']['prefork']['max_clients']           = 150
default['apache']['prefork']['max_requests_perchild'] = 0

# Worker
default['apache']['worker']['start_servers']         = 2
default['apache']['worker']['min_spare_threads']     = 25
default['apache']['worker']['max_spare_threads']     = 75
default['apache']['worker']['max_clients']           = 150
default['apache']['worker']['max_requests_perchild'] = 0
default['apache']['worker']['threads_perchild']      = 25

# SSL
default['apache']['ssl']['session_cache_timeout']  = 300
default['apache']['ssl']['certificate_file']       = ""
default['apache']['ssl']['certificate_key_file']   = ""
default['apache']['ssl']['certificate_chain_file'] = ""
