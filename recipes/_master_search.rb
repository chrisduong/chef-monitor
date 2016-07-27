#
# Cookbook Name:: monitor
# Recipe:: _master_search
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

master_address = node['monitor']['master_address']

if master_address.nil?
  master_node = search(:node, node['monitor']['master_search_query'])
  raise 'Master node not found, exit !!' if master_node.empty?
  master_address = master_node['ipaddress']
end

node.override['sensu']['rabbitmq']['host'] = master_address
node.override['sensu']['redis']['host'] = master_address
node.override['sensu']['api']['host'] = master_address
