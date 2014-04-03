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


# Modify conf
template "#{node['apache']['dir']}/conf/httpd.conf" do
  source   "httpd.conf.erb"
  owner    node['apache']['install_user']
  group    node['apache']['install_group']
  mode     00644
  notifies :run, 'bash[restart apache]', :immediately
end


# Modify extra conf
for include_file in node['apache']['include_files']
  template "#{node['apache']['dir']}/conf/extra/#{include_file}.conf" do
    source   "#{include_file}.conf.erb"
    owner    node['apache']['install_user']
    group    node['apache']['install_group']
    mode     00644
    notifies :run, 'bash[restart apache]', :immediately
  end
end


# Bashs
bash "start apache" do
  action :nothing
  flags  '-ex'
  user   node['apache']['install_user']
  code   <<-EOH
    #{node['apache']['dir']}/bin/apachectl start
  EOH
end

bash "restart apache" do
  action :nothing
  flags  '-ex'
  user   node['apache']['install_user']
  code   <<-EOH
    #{node['apache']['dir']}/bin/apachectl restart
  EOH
end
