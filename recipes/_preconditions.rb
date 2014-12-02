#
# Cookbook Name:: chamber-kibana
# Recipe:: _preconditions.rb
#
include_recipe 'chef-sugar::default'
require 'chef/sugar/core_extensions'

fail "Cookbook is incompatible with #{platform_family?}" unless platform_family?('rhel', 'debian')
if node['kibana']['user'].blank?
  fail 'Kibana user/group ownership attributes are missing'
end
