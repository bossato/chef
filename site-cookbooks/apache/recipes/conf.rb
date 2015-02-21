#
# Cookbook Name:: apache
# Recipe:: conf
#
# Copyright 2015, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Modify conf
template "#{node['apache']['dir']}/conf/httpd.conf" do
  source   "httpd.conf.#{node['apache']['main_version']}.erb"
  owner    node['apache']['install_user']
  group    node['apache']['install_group']
  mode     00644
end


# Modify extra conf
for include_file in node['apache']['include_files']
  template "#{node['apache']['dir']}/conf/extra/#{include_file}.conf" do
    source   "#{include_file}.conf.erb"
    owner    node['apache']['install_user']
    group    node['apache']['install_group']
    mode     00644
    notifies :run, 'bash[start apache]', :immediately
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
