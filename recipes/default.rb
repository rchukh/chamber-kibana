#
# Cookbook Name:: chamber-kibana
# Recipe:: default
#
include_recipe 'chamber-kibana::_preconditions'
include_recipe 'chamber-kibana::dependencies'
include_recipe 'ark'

# Create user and group
#
group node['kibana']['user'] do
  gid node['kibana']['gid']
  action :create
  system true
end

user node['kibana']['user'] do
  comment 'Kibana User'
  home "#{node['kibana']['dir']}/kibana"
  shell '/bin/bash'
  uid node['kibana']['uid']
  gid node['kibana']['user']
  supports manage_home: false
  action :create
  system true
end

# Create ES directories
#
[node['kibana']['path']['conf'], node['kibana']['path']['logs']].each do |path|
  directory path do
    owner node['kibana']['user']
    group node['kibana']['user']
    mode 0755
    recursive true
    action :create
  end
end

directory node['kibana']['pid_path'] do
  mode 00755
  recursive true
end

# Create service
#
template '/etc/init.d/kibana' do
  source 'kibana.init.erb'
  owner 'root'
  mode 0755
end

service 'kibana' do
  supports status: true, restart: true
  action [:enable]
end

# Download, extract, symlink the kibana libraries and binaries
#
ark_prefix_root = node['kibana']['dir'] || node['ark']['prefix_root']
ark_prefix_home = node['kibana']['dir'] || node['ark']['prefix_home']

ark 'kibana' do
  url node['kibana']['download_url']
  owner node['kibana']['user']
  group node['kibana']['user']
  version node['kibana']['version']
  has_binaries ['bin/kibana']
  checksum node['kibana']['checksum']
  prefix_root ark_prefix_root
  prefix_home ark_prefix_home

  notifies :start,   'service[kibana]' unless node['kibana']['skip_start']
  notifies :restart, 'service[kibana]' unless node['kibana']['skip_restart']

  not_if do
    link   = "#{node['kibana']['dir']}/kibana"
    target = "#{node['kibana']['dir']}/kibana-#{node['kibana']['version']}"
    binary = "#{target}/bin/kibana"

    ::File.directory?(link) && ::File.symlink?(link) && ::File.readlink(link) == target && ::File.exist?(binary)
  end
end

# Create ES config file
#
template 'kibana.yml' do
  path "#{node['kibana']['path']['conf']}/kibana.yml"
  source node['kibana']['templates']['kibana_yml']
  owner node['kibana']['user']
  group node['kibana']['user']
  mode 0755

  notifies :restart, 'service[kibana]' unless node['kibana']['skip_restart']
end
