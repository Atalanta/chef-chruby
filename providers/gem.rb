# Copyright 2014, Bloomberg Finance L.P.
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

def load_current_resource
  @options = new_resource.options
  @options = @options.each { |k,v| "--#{k}" if v }.join(' ') if @options.is_a?(Hash)
end

%w(install remove).each do |type|
  action type.to_sym do
    gem_package "chruby #{new_resource.ruby}: #{new_resource.package_name}" do
      package_name new_resource.package_name
      gem_binary ::File.join(node['chruby']['install_prefix'], new_resource.ruby, 'bin/gem')
      version new_resource.version if new_resource.version
      options @options if @options
      action type.to_sym
    end
  end
end
