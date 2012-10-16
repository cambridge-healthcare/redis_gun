# RedisGun

For when you need many unique redis-server instances.

I have been using a version of this for a few years now, never took the
time to open source it. In the current form, it's just a more convenient
way to share it among multiple apps. Tests didn't make sense.

For alternatives, there's [redis-spawn][redis-spawn] &
[fakeredis][fakeredis].

## Installation

Add this line to your application's Gemfile:

    gem 'redis_gun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_gun

## Usage

See the **examples** directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[redis-spawn]: https://github.com/LichP/redis-spawn
[fakeredis]: https://github.com/guilleiguaran/fakeredis
