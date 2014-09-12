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

repo_path = "#{Chef::Config["file_cache_path"]}/chruby"
execute "Install chruby" do
  cwd repo_path
  command %{sudo make install}

  action :nothing
end

git repo_path do
  repository node["chruby"]["git_url"]
  reference "v#{node["chruby"]["version"]}"

  action :sync

  notifies :run, resources(execute: "Install chruby"), :immediately
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
