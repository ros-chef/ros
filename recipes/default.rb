#
# Cookbook Name:: ros
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

ros 'indigo' do
  release 'indigo'
  flavor node[:ros][:flavor]
end
