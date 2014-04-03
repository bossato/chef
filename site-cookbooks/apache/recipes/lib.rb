#
# Cookbook Name:: apache
# Recipe:: lib
#
# Copyright 2014, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Install APR
for library in ["apr", "apr-util"]
  remote_file "#{node['apache']['src_dir']}#{node[library]['file_name']}" do
    source "#{node[library]['remote_uri']}"
    owner  node['apache']['install_user']
    group  node['apache']['install_user']
  end

  bash "install #{library}" do
    user     node['apache']['install_user']
    cwd      node['apache']['src_dir']
    code   <<-EOH
      tar xzf #{node[library]['file_name']}
      cd #{node[library]['version']}
      make clean
      ./configure #{node[library]['configure']}
      make
      make install
    EOH
  end
end

# Install PCRE
remote_file "#{node['apache']['src_dir']}#{node['pcre']['file_name']}" do
  source "#{node['pcre']['remote_uri']}"
  owner  node['apache']['install_user']
  group  node['apache']['install_user']
end

bash "install pcre" do
  user     node['apache']['install_user']
  cwd      node['apache']['src_dir']
  code   <<-EOH
    tar xzf #{node['pcre']['file_name']}
    cd #{node['pcre']['version']}
    make clean
    ./configure #{node['pcre']['configure']}
    make
    make install
  EOH
end
