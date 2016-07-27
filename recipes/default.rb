#
# Cookbook Name:: monitor
# Recipe:: default
#
# Copyright 2016 cduong13 <chris.duong83@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'monitor::_master_search'
include_recipe 'sensu::default'

sensu_client node.name do
  address node['ipaddress']
  subscriptions node['roles'] + ['all']
  keepalive node['monitor']['keepalive']
  additional node['monitor']['additional_client_attributes']
end

sensu_gem 'sensu-plugin' do
  version node['monitor']['sensu_plugin_version']
end

# Install common plugins (where subscribers are 'all')
# NOTE: the most neccessary plugins
%w(memory cpu disk).each do |p|
  sensu_gem "sensu-plugins-#{p}-checks"
end

include_recipe 'sensu::client_service'
