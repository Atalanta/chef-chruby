# chruby cookbook

Installs the Chruby utility for changing between Ruby versions.  Chruby is a vastly simplified rbenv - it's about 90 lines of code, and very easy to understand.

# Requirements

- Depends on the `ark` cookbook and the `ruby-build` cookbook.
- Tested on Centos 6.4 only, so far.

# Usage

Include the `chruby` recipe in your run list.  This will make the chruby tool available to every shell, and make the embedded Ruby from the Omnibus install available for use.

# Attributes

- `node['chruby']['version']` - the version of Chruby to install.  Default is 0.3.4.
- `node['chruby']['gpg_check']` - run the GPG check to verify the release was not tampered with.
- `node['chruby']['use_rvm_rubies']` - make Rubies installed using RVM available to chruby.
- `node['chruby']['use_rbenv_rubies']` - make Rubies installed using Rbenv available to chruby.
- `node['chruby']['auto_switch']` - enable automatic switching between Ruby versions per https://github.com/postmodern/chruby#auto-switching
- `node['chruby']['rubies']` - an array of Rubies to install using the `ruby-build` LWRP, and make available to chruby.
- `node['chruby']['default']` - specify the default Ruby version for every shell.
- `node['chruby']['user_rubies']` - a hash tp specify per-user default Rubies.
 
# Recipes

## Default

Installs the chruby utility, and makes it available to every shell.  If Chef was installed with the Omnibus installer, make embedded Ruby available as an option for usage.

## Auto

Installs the latest versions of MRI, Jruby and Rubinius, and makes them available.

## System

Builds and makes available the Ruby versions listed in the `node['chruby']['rubies']` attribute, using the `ruby-build` LWRP.

# Author

Author:: Stephen Nelson-Smith (<support@atalanta-systems.com>)
