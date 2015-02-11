#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Install library
include_recipe "apache::lib"


# Get source file
remote_file "#{node['apache']['src_dir']}#{node['apache']['file_name']}" do
  source "#{node['apache']['remote_uri']}"
end


# Install Apache
bash "install apache" do
  user     node['apache']['install_user']
  cwd      node['apache']['src_dir']
  not_if   "ls #{node['apache']['dir']}"
  notifies :run, 'bash[start apache]', :immediately
  code   <<-EOH
    tar xzf #{node['apache']['file_name']}
    cd #{node['apache']['version']}
    ./configure #{node['apache']['configure']}
    make
    make install
  EOH
end
