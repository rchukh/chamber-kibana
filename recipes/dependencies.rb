#
# Cookbook Name:: chamber-kibana
# Recipe:: dependencies
#
include_recipe 'chef-sugar::default'

if node['kibana']['dependency']['install_java']
  include_recipe 'java::default'
else
  unless installed?('java')
    Chef::Application.fatal!('Java is missing. It is not installed and it is excluded for installation.')
  end
end

if node['kibana']['dependency']['install_elasticsearch']
  include_recipe 'elasticsearch::default'
end
