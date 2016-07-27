#
# Cookbook Name:: monitor
# Recipe:: _mailer_handler
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

# https://github.com/sensu-plugins/sensu-plugins-mailer
sensu_gem 'sensu-plugins-mailer' do
  version '~> 0.0'
end

mailer_content = {
  admin_gui: node['monitor']['mailer']['admin_gui'],
  mail_from: node['monitor']['mailer']['mail_from'],
  mail_to:   node['monitor']['mailer']['mail_to'],
  smtp_address: node['monitor']['mailer']['smtp_address'],
  smtp_port: node['monitor']['mailer']['smtp_port'],
  smtp_domain: node['monitor']['mailer']['smtp_domain']
}

unless node['monitor']['mailer']['subscriptions'].empty?
  mailer_content[:subscriptions] = node['monitor']['mailer']['subscriptions']
end

sensu_snippet 'mailer' do
  content mailer_content
end

# Default
sensu_handler 'mailer' do
  type 'pipe'
  command 'handler-mailer.rb'
end

# NOTE: Can be  more here, with another pair of mailer **json_config**
# and handler name.
# sensu_snippet 'mail_to_ceo'
# sensu_handler 'mail_to_ceo'
