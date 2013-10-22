#
# Cookbook Name:: chruby
# Recipe:: default
#
# Copyright (C) 2013 Atalanta Systems Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "ark"

ark "chruby" do
  url "https://github.com/postmodern/chruby/archive/v#{node['chruby']['version']}.tar.gz"
  action :install_with_make
end

# Workaround for Github issue 5 https://github.com/Atalanta/chef-chruby/issues/5

link "/usr/local/chruby" do
  to "/usr/local/chruby-1"
end

sh_owner = node['chruby']['sh_owner']

directory node['chruby']['sh_dir'] do
  recursive true
  owner sh_owner if sh_owner
end

template File.join(node['chruby']['sh_dir'], node['chruby']['sh_name']) do
  source "chruby.sh.erb"
  mode "0644"
  owner sh_owner if sh_owner
end
