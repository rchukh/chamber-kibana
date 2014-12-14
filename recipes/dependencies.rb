#
# Cookbook Name:: chamber-kibana
# Recipe:: dependencies
#
include_recipe 'chef-sugar::default'

if node['kibana']['dependency']['install_java']
  include_recipe 'apt::default' if debian?
  include_recipe 'java::default'
else
  ruby_block 'check_java' do
    block do
      fail 'Java is missing. It is not installed and it is excluded for installation.'
    end
    action :run
    not_if { installed?('java') }
  end
end

if node['kibana']['dependency']['install_elasticsearch']
  include_recipe 'elasticsearch::default'
end
