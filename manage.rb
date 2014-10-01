#!/usr/bin/env ruby
require 'redis'

HOSTS = { :redis01 => "192.168.57.2",
          :redis02 => "192.168.57.3",
          :redis03 => "192.168.57.4"
}

CONNECTIONS = HOSTS.inject({}) do |c, (k, v)|
  c[k] = Redis.new host: v
  c
end

$sentinel = Redis.new host: HOSTS[:redis01], port: 26379

case ARGV[0].to_sym
when :setup
  CONNECTIONS[:redis01].slaveof "NO", "ONE"
  CONNECTIONS[:redis02].slaveof HOSTS[:redis01], 6379
  CONNECTIONS[:redis03].slaveof HOSTS[:redis01], 6379
when :failover
  $sentinel.sentinel :failover, :test
when :kill
  ip, port = $sentinel.client.call %w(sentinel get-master-addr-by-name test)
  r = Redis.new host: ip, port: port
  r.client.call %w(debug segfault)
when :restore
  HOSTS.each do |k, v|
    %x[vagrant ssh #{k} -- sudo service redis start]
  end
when :status
  puts $sentinel.info['master0']
when :console
  exec("redis-cli -h #{HOSTS[ARGV[1].to_sym]}")
end
