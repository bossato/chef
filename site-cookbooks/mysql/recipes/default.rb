#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Get source file
remote_file "#{node['mysql']['src_dir']}#{node['mysql']['file_name']}" do
  source "#{node['mysql']['remote_uri']}"
end


# Install MySQL
bash "install mysql" do
  user     node['mysql']['install_user']
  cwd      node['mysql']['src_dir']
  code   <<-EOH
    tar xf #{node['mysql']['file_name']}
  EOH
end

node['mysql']['rpm'].each do |rpm|
  package rpm[:package_name] do
    action   :install
    provider Chef::Provider::Package::Rpm
    source   "#{node['mysql']['src_dir']}#{rpm[:rpm_file]}"
  end
end


# Bashs
bash "restart mysql" do
  action :nothing
  flags  '-ex'
  user   node['mysql']['install_user']
  code   <<-EOH
    /etc/rc.d/init.d/mysql stop
    /etc/rc.d/init.d/mysql start
  EOH
end
