default['chruby']['version'] = '0.3.4'
default['chruby']['gpg_check'] = false
default['chruby']['use_rvm_rubies'] = false
default['chruby']['use_rbenv_rubies'] = false
default['chruby']['auto_switch'] = true
default['chruby']['rubies'] = {'1.9.3-p392' => true}
default['chruby']['default'] = 'embedded'
default['chruby']['user_rubies'] = {}
default['chruby']['sh_dir'] = "/etc/profile.d"
default['chruby']['sh_name'] = 'chruby.sh'
