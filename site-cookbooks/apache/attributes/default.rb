###
## Install Settings
####

## Version
default['apache']['version']    = "httpd-2.4.10"

## File
default['apache']['file_name'] = "#{default['apache']['version']}.tar.gz"
default['apache']['remote_uri'] = "http://ftp.meisei-u.ac.jp/mirror/apache/dist//httpd/#{default['apache']['file_name']}"

## Directory
default['apache']['dir']     = "/usr/local/apache2"
default['apache']['src_dir'] = "/usr/local/src/"

## User
default['apache']['install_user']  = "root"
default['apache']['install_group'] = "root"

## Configure Options
default['apache']['configure']  = "--prefix=#{default['apache']['dir']} --enable-ssl --with-ssl --enable-rewrite=shared --enable-headers=shared --enable-so --with-mpm=prefork"

## Include files
default['apache']['include_files']  = [
  "httpd-mpm",
  "httpd-vhosts",
  "httpd-ssl"
]

## Include library
include_attribute "apache::lib"
