#
# Cookbook Name:: chruby
# Recipe:: default
#
# Copyright (C) 2013 Atalanta Systems Ltd
# Copyright (C) 2014, 2015 Bloomberg Finance L.P.
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
#

include_recipe 'libarchive::default'

archive = remote_file node['chruby']['source_url'] % { version: node['chruby']['version'] } do
  checksum node['chruby']['source_checksum']
end

directory node['chruby']['install_path'] do
  recursive true
end

libarchive_file File.basename(archive.path) do
  path archive.path
  extract_to File.join(node['chruby']['install_path'], node['chruby']['version'])
  action :extract
end

execute "make install --prefix #{node['chruby']['prefix_path']}" do
  cwd File.join(node['chruby']['install_path'], node['chruby']['version'])
end

template '/etc/profile.d/chruby.sh' do
  source 'chruby.sh.erb'
  only_if { node['chruby']['sh_profile'] }
end
