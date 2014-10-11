#
# Cookbook Name:: chamber-kibana
# Recipe:: _preconditions.rb
#
include_recipe 'chef-sugar::default'
require 'chef/sugar/core_extensions'

unless centos?
  Chef::Application.fatal!('Cookbook is incompatible with #{platform_family?}')
end

if node['kibana']['user'].blank?
  Chef::Application.fatal!('Kibana user/group ownership attributes are missing')
end
