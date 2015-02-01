#
# Cookbook Name:: mysql
# Recipe:: cnf
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Modify cnf
template "/etc/my.cnf" do
  source   "my.cnf.erb"
  owner    node['mysql']['install_user']
  group    node['mysql']['install_group']
  mode     00644
  notifies :run, 'bash[restart mysql]', :immediately
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
