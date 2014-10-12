#
# Cookbook Name:: chamber-kibana
# Recipe:: dependencies
#
include_recipe 'chef-sugar::default'
require 'chef/sugar/core_extensions'

if node['kibana']['dependency']['install_java'].blank?
  include_recipe 'java::default'
end

if node['kibana']['dependency']['install_elasticsearch'].blank?
  include_recipe 'elasticsearch::default'
end
