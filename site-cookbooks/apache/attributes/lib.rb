###
## APR Settings
####

## Version
default['apr']['version']      = "apr-1.5.1"
default['apr-util']['version'] = "apr-util-1.5.4"

## File
default['apr']['file_name']  = "#{default['apr']['version']}.tar.gz"
default['apr']['configure']  = ""

default['apr-util']['file_name']  = "#{default['apr-util']['version']}.tar.gz"
default['apr-util']['configure']  = "--with-apr=/usr/local/apr/"


###
## PCRE Settings
####

## Version
default['pcre']['version'] = "pcre-8.36"

## File
default['pcre']['file_name']  = "#{default['pcre']['version']}.tar.gz"
default['pcre']['configure']  = ""
