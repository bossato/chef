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
