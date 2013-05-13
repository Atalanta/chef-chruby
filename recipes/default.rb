#
# Cookbook Name:: chruby
# Recipe:: default
#
# Copyright (C) 2013 Atalanta Systems Ltd
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "ruby_build"
include_recipe "ark"

ark "chruby" do
  url "https://github.com/postmodern/chruby/archive/v0.3.4.tar.gz"
  action :install_with_make
end

node['chruby']['rubies'].each do |rb| 
  ruby_build_ruby rb do
    prefix_path "/opt/rubies"
  end
end

template "/etc/profile.d/chruby.sh" do
  source "chruby.sh.erb"
  mode "0644"
end
