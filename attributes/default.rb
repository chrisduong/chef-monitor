#
# Cookbook Name:: monitor
# Attribute:: default
#
# Copyright (C) 2016 cduong13 <chris.duong83@gmail.com>
#

# Sensu conf
default['sensu']['use_embedded_ruby'] = true

## monitor
default['monitor']['master_address'] = nil
default['monitor']['master_search_query'] = 'recipes:monitor\\:\\:master'
default['monitor']['keepalive'] = Mash.new
default['monitor']['additional_client_attributes']['environment'] =
  node.chef_environment
default['monitor']['sensu_plugin_version'] = nil

# Uchiwa frontend
default['exim4']['configtype'] = 'internet'
