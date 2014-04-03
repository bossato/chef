#
# Cookbook Name:: php
# Recipe:: lib
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Install Mcrpt
for library in ["mcrpt", "mcrpt-devel"]
  remote_file "#{node['php']['src_dir']}#{node[library]['file_name']}" do
    source "#{node[library]['remote_uri']}"
    owner  node['php']['install_user']
    group  node['php']['install_user']
  end

  package node[library]['file_name'] do
    action   :install
    provider Chef::Provider::Package::Rpm
    source   "#{node['php']['src_dir']}#{node[library]['file_name']}"
  end
end

# Install re2c
cookbook_file "#{node['php']['src_dir']}#{node['re2c']['file_name']}" do
  mode 0644
end

bash "install re2c" do
  user     node['php']['install_user']
  cwd      node['php']['src_dir']
  code   <<-EOH
    tar xzf #{node['re2c']['file_name']}
    cd #{node['re2c']['version']}
    ./configure
    make
    make install
  EOH
end
