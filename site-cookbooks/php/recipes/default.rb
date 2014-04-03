#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Install library
include_recipe "php::lib"

# Get source file
remote_file "#{node['php']['src_dir']}#{node['php']['file_name']}" do
  source "#{node['php']['remote_uri']}"
end

# Install PHP
node['php']['library'].each do |library|
  package library do
    action   :install
  end
end

configure = node['php']['configure'].join(" ")

bash "install php" do
  user     node['php']['install_user']
  cwd      node['php']['src_dir']
  not_if   "which php"
  code   <<-EOH
    tar xzf #{node['php']['file_name']}
    cd #{node['php']['version']}
    ./configure #{configure}
    make
    make install
  EOH
end

bash "upgrade pear" do
  user     node['php']['install_user']
  cwd      node['php']['src_dir']
  code   <<-EOH
    pear upgrade
  EOH
end

template "#{node['php']['conf_dir']}php.ini" do
  source   "php.ini.erb"
  owner    node['php']['install_user']
  group    node['php']['install_group']
  mode     00644
end
