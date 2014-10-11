#
# Cookbook Name:: chamber-kibana
# Recipe:: dependencies
#
# TODO: Add attribute for possibility to skip Java install
include_recipe 'java::default'
# TODO: Add attribute for possibility to skip ElasticSearch install
include_recipe 'elasticsearch::default'
