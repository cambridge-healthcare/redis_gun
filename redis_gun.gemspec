# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_gun/version'

Gem::Specification.new do |gem|
  gem.name          = "redis_gun"
  gem.version       = RedisGun::VERSION
  gem.authors       = ["Gerhard Lazu"]
  gem.email         = ["gerhard@lazu.co.uk"]
  gem.description   = %q{Starts many redis-server instances quickly}
  gem.summary       = %q{For when you need many unique redis-server instances}
  gem.homepage      = "https://github.com/cambridge-healthcare/redis_gun"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
