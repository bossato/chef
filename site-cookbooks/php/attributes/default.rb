###
## Install Settings
####

# Version
default['php']['version']    = "php-5.5.21"

# File
default['php']['file_name'] = "#{default['php']['version']}.tar.gz"
default['php']['remote_uri'] = "http://jp1.php.net/get/#{default['php']['file_name']}/from/this/mirror"

# Directory
default['php']['src_dir']    = "/usr/local/src/"
default['php']['conf_dir']   = "/usr/local/lib/"
default['php']['apache_dir'] = "/usr/local/apache2/"

# User
default['php']['install_user']  = "root"
default['php']['install_group'] = "root"

# Library
default['php']['library']  = [
    "bison",
    "curl",
    "curl-devel",
    "libxml2-devel"
]

## Include library
include_attribute "php::lib"

# Configure Options
default['php']['configure'] = %W{--enable-mbstring
                                 --enable-mbregex
                                 --enable-bcmath
                                 --disable-debug
                                 --with-config-file-path=#{php['conf_dir']}
                                 --with-apxs2=#{php['apache_dir']}bin/apxs
                                 --with-curl
                                 --with-libdir=lib64
                                 --with-mcrypt
                                 --with-openssl
                                 --with-mysql
                                 --with-pdo-mysql
                                 --with-xmlrpc
                                 --with-zlib}


###
# Conf Settings
###

# Output
default['php']['output_buffering'] = "On"
default['php']['expose_php']       = "Off"
default['php']['error_reporting']  = "E_ALL"

# Memory
default['php']['memory_limit']  = "128M"

# Timezone
default['php']['timezone'] = "Asia/Tokyo"

# Session
default['php']['entropy_length'] = 32
default['php']['entropy_file']   = "/dev/urandom"
default['php']['hash_function']  = 1

# Mbstring
default['php']['internal_encoding']    = "UTF-8"
default['php']['http_input']           = "pass"
default['php']['http_output']          = "UTF-8"
default['php']['encoding_translation'] = "Off"
default['php']['detect_order']         = "auto"
