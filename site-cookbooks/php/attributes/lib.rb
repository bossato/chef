###
## Mcrpt Settings
####

## Version
default['mcrpt']['version'] = default['mcrpt-devel']['version'] = "2.5.8-9"

## File
default['mcrpt']['file_name']  = "libmcrypt-#{default['mcrpt']['version']}.el6.x86_64.rpm"
default['mcrpt']['remote_uri'] = "http://repo.webtatic.com/yum/el6/x86_64/#{default['mcrpt']['file_name']}"

default['mcrpt-devel']['file_name']  = "libmcrypt-devel-#{default['mcrpt-devel']['version']}.el6.x86_64.rpm"
default['mcrpt-devel']['remote_uri'] = "http://repo.webtatic.com/yum/el6/x86_64/#{default['mcrpt-devel']['file_name']}"


###
## re2c Settings
####

## Version
default['re2c']['version']  = "re2c-0.13.6"

## File
default['re2c']['file_name']  = "#{default['re2c']['version']}.tar.gz"
