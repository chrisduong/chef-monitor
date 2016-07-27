#
# Cookbook Name:: monitor
# Attribute:: handler
#
# Copyright (C) 2016 cduong13 <chris.duong83@gmail.com>
#

# you define more custom mailers in `_mailer_handler.rb` recipe
default['monitor']['default_handlers'] = ['mailer']
default['monitor']['metric_handlers'] = ['debug']

# InfluxDB connection for the handler
default['monitor']['influxdb_udp_host'] = nil
default['monitor']['influxdb_udp_port'] = 8189
