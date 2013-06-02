# chruby cookbook

Installs the Chruby utility for changing between Ruby versions.
Chruby is a vastly simplified rbenv - it's about 90 lines of code, and
very easy to understand.

# Requirements

- Depends on the `ark` cookbook and the `ruby-build` cookbook.
- Tested on:
  - CentOS 6.3 and 6.4
  - CentOS 5.8
  - Ubuntu 12.04
  - Ubuntu 10.04

# Usage

Include the `chruby` recipe in your run list.  This will make the
chruby tool available to every shell, and make the embedded Ruby from
the Omnibus install available for use.

Chruby uses `ruby-build` to make Ruby versions available on the OS.

The version to build are defined in the node attribute `node['chruby']['rubies']`

This is a hash of Ruby versions, with a boolean flag, specifying whether the version should be installed.

For example, the cookbook default says:

    default['chruby']['rubies'] = {'1.9.3-p392' => true}

If you want to disable this, set the value to false in a role or a wrapper cookbook.  For a role:

```
default_attributes(
  "chruby" => {
    "rubies" => {
      "1.9.3-p392" => false,
      "1.9.3-p429" => true
    },
    "default" => "1.9.3-p429"
  }
)
```

For a wrapper cookbook:

```
node.set['chruby']['rubies'] = { "1.9.3-p392" => false, "1.9.3-p429" => true }
```

These Ruby versions are installed using the LWRP provided by the `ruby_build` cookbook.

Ensure you set an explicit dependency on the `chruby` cookbook if you are using a wrapper cookbook.

# Attributes

- `node['chruby']['version']` - the version of Chruby to install.  Default is 0.3.4.
- TODO: `node['chruby']['gpg_check']` - run the GPG check to verify the release was not tampered with.
- `node['chruby']['use_rvm_rubies']` - make Rubies installed using RVM available to chruby.
- `node['chruby']['use_rbenv_rubies']` - make Rubies installed using Rbenv available to chruby.
- `node['chruby']['auto_switch']` - enable automatic switching between Ruby versions per https://github.com/postmodern/chruby#auto-switching
- `node['chruby']['rubies']` - an hash of Rubies / Booleans values to install using the `ruby-build` LWRP, and make available to chruby.
- `node['chruby']['default']` - specify the default Ruby version for every shell.
 
# Recipes

## Default

Installs the chruby utility, and makes it available to every shell.  If Chef was installed with the Omnibus installer, make embedded Ruby available as an option for usage.

## System

Builds and makes available the Ruby versions listed in the `node['chruby']['rubies']` attribute, using the `ruby-build` LWRP.

# Author and License

- Author: Stephen Nelson-Smith (LordCope) - Atalanta Systems Ltd (<cookbooks@atalanta-systems.com>)

Copyright 2013, Atalanta Systems Ltd 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
