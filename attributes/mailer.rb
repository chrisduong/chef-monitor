#
# Cookbook Name:: monitor
# Attribute:: mailer
#
# Copyright (C) 2016 cduong13 <chris.duong83@gmail.com>
#

# Default mailer settings
default['monitor']['mailer']['admin_gui'] = "#{node['fqdn']}:3000"
default['monitor']['mailer']['mail_from'] = "sensu@#{node['fqdn']}"
default['monitor']['mailer']['mail_to'] = "root@#{node['fqdn']}"
default['monitor']['mailer']['smtp_address'] = 'localhost'
default['monitor']['mailer']['smtp_port'] = 25
default['monitor']['mailer']['smtp_domain'] = node['fqdn']

# Mail subscription
default['monitor']['mailer']['subscriptions'] = {}
