#
# Cookbook Name:: chruby
# License:: Apache 2.0
#
# Copyright 2014, 2015 Bloomberg Finance L.P.
#
class Chef::Provider::ChrubyExec < Chef::Provider::LWRPBase
  use_inline_resources if defined?(use_inline_resources)

  def whyrun_supported?
    true
  end

  action :run do
    execute "chruby exec-#{new_resource.ruby}[#{new_resource.command}]" do
      command %Q(chruby-exec "#{new_resource.ruby}" -- #{new_resource.command})
    end
  end
end
