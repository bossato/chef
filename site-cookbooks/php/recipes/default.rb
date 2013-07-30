#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "#{node['php']['src_dir']}#{node['php']['version']}.tar.gz" do
  mode 0644
end

%W{libxml2-devel curl-devel}.each do |pkg|
  package pkg do
    action :install
  end
end

configure = node['php']['configure'].join(" ")

bash "install php" do
  user     node['php']['install_user']
  cwd      node['php']['src_dir']
  not_if   "which php"
  code   <<-EOH
    tar xzf #{node['php']['version']}.tar.gz
    cd #{node['php']['version']}
    ./configure #{configure}
    make
    make install
    cp #{node['php']['src_dir']}#{node['php']['version']}/php.ini-production #{node['php']['conf_dir']}php.ini
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

