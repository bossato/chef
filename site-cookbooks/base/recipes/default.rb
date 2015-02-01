#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, Kazuya Sato
#
# All rights reserved - Do Not Redistribute
#

# Update yum
execute "yum-update" do
  user    'root'
  command 'yum -y update'
  action  :run
end

# Install packages
%w{gcc make zlib zlib-devel libffi-devel openssl-devel git vim tmux}.each do |pkg|
  package pkg do
    action :install
  end
end
