default['chruby']['source_url'] = 'https://github.com/postmodern/chruby/archive/v%{version}.zip'
default['chruby']['source_checksum'] = nil
default['chruby']['version'] = '0.3.9'
default['chruby']['prefix_path'] = '/usr/local/chruby'
default['chruby']['install_path'] = '/usr/local/src/chruby'

default['chruby']['sh_profile'] = false
default['chruby']['sh_rubies'] = []
default['chruby']['sh_default_ruby'] = nil
default['chruby']['sh_auto_switch'] = false
