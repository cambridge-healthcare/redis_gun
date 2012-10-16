#!/usr/bin/env ruby

require 'bundler/setup'
require 'awesome_print'
require 'pry'
require 'redis'
require 'redis/distributed'
require 'redis_gun'

def exemplify(description, object)
  puts "\n::: #{description} ".ljust(70, ":::")
  ap(object, indent: -2)
end

r = RedisGun::RedisServer.new
exemplify("Start 1 redis server", r)
r.stop

redii = 10.times.inject([]) do |result|
  result << RedisGun::RedisServer.new
end
exemplify("Start 10 redis servers", redii)
exemplify("Stop all 10 redis servers", redii.map(&:stop))
