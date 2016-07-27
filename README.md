# monitor cookbook

Inspired from [PorterTech cookbook](https://github.com/portertech/chef-monitor)

Sensu Monitoring System.

Install and configure a **single Sensu master** (running Redis and RabbitMQ)
and multiple **workers** (for scaling).

## Supported Platforms

Supports Ubuntu 14.04.

## Attributes

See `attributes/*.rb` for default values.

Sensu attributes:
- `node['sensu']['use_embedded_ruby']` - default is `true`.
- `node['sensu']['master_address']` if this attribute is used, the
`master_search_query` would not be used.

## Usage

### `monitor::_worker` recipe

This recipe configure  **worker** to run some *handlers* and send them to **master**.
All the checks has been done in the client side. We can launch more **workers**
to handle more load by splitting checks between workers.

Workers would send checks from *data bags* to **clients** who subscribes it,
sending metrics to **master**.

### `monitor::default` recipe

This recipe install and configure **Sensu client**(address, subscriptions,...)
for its **master**. Get **Common checks**(CPU, Disk, Memory) from **workers**.

Sensu client should run **standalone checks** for its **specific service**.

### `monitor::master`

This recipe install **Sensu Master**

  - Install RabbitMQ, Redis, Sensu API in Sensu master.
  - Configure it is the *worker* for itself.
  - Install and start API service.
  - Install Uchiwa front-end.
  - Install it as client

### Handlers recipes

- **default handlers**. The default is *mailer*.
- **metric handlers**. The default is *influxdb_udp*
( If you _use_ this handler, please make sure InfluxDB had been deployed,
and `udp_port` is set correctly. This cookbook only supports  **InfluxDB**
at the moment.

## License and Authors

Author:: cduong13 (<chris.duong83@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
