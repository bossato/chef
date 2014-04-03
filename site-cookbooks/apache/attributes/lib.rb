###
## APR Settings
####

## Version
default['apr']['version']      = "apr-1.5.0"
default['apr-util']['version'] = "apr-util-1.5.3"

## File
default['apr']['file_name']  = "#{default['apr']['version']}.tar.gz"
default['apr']['remote_uri'] = "http://ftp.tsukuba.wide.ad.jp/software/apache//apr/#{default['apr']['file_name']}"
default['apr']['configure']  = ""

default['apr-util']['file_name']  = "#{default['apr-util']['version']}.tar.gz"
default['apr-util']['remote_uri'] = "http://ftp.tsukuba.wide.ad.jp/software/apache//apr/#{default['apr-util']['file_name']}"
default['apr-util']['configure']  = "--with-apr=/usr/local/apr/"


###
## PCRE Settings
####

## Version
default['pcre']['version'] = "pcre-8.34"

## File
default['pcre']['file_name']  = "#{default['pcre']['version']}.tar.gz"
default['pcre']['remote_uri'] = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/#{default['pcre']['file_name']}"
default['pcre']['configure']  = ""
