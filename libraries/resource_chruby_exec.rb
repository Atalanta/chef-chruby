#
# Cookbook Name:: chruby
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#
class Chef::Resource::ChrubyExec < Chef::Resource::LWRPBase
  self.resource_name = :chruby_exec
  actions :run
  default_action :run

  attribute :command, kind_of: String, name_attribute: true
  attribute :ruby, kind_of: String
end
