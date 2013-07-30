###
# Install Settings
###

# Version
default['php']['version'] = "php-5.3.27"

# Directory
default['php']['src_dir']    = "/usr/local/src/"
default['php']['conf_dir']   = "/usr/local/lib/"
default['php']['apache_dir'] = "/usr/local/apache2/"

# User
default['php']['install_user']  = "root"
default['php']['install_group'] = "root"

# Configure Options
default['php']['configure'] = %W{--enable-mbstring
                                 --enable-mbregex
                                 --enable-bcmath
                                 --with-config-file-path=#{php['conf_dir']}
                                 --with-apxs2=#{php['apache_dir']}bin/apxs
                                 --disable-debug
                                 --with-zlib
                                 --with-libdir=lib64
                                 --with-curl
                                 --enable-zend-multibyte}


###
# Conf Settings
###

# Output
default['php']['output_buffering'] = "On"
default['php']['output_handler']   = "mb_output_handler"
default['php']['expose_php']       = "Off"
default['php']['error_reporting']  = "E_ALL"

# Timezone
default['php']['date']['timezone'] = "Asia/Tokyo"

# Session
default['php']['session']['entropy_length'] = 32
default['php']['session']['entropy_file']   = "/dev/urandom"
default['php']['session']['hash_function']  = 1

# Mbstring
default['php']['mbstring']['internal_encoding']    = "UTF-8"
default['php']['mbstring']['http_input']           = "pass"
default['php']['mbstring']['http_output']          = "UTF-8"
default['php']['mbstring']['encoding_translation'] = "Off"
default['php']['mbstring']['detect_order']         = "auto"
