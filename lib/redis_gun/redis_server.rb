require 'securerandom'

module RedisGun
  class RedisServer
    attr_reader :config

    def initialize(custom_config={})
      @uuid = SecureRandom.uuid

      @config = {
        :daemonize  => "yes",
        :pidfile    => "/tmp/redis-server.#{@uuid}.pid",
        :port       => 0,
        :unixsocket => "/tmp/redis-server.#{@uuid}.sock",
        :loglevel   => "notice",
        :logfile    => "stdout",
        :databases  => 16,
      }.merge(custom_config)

      start
    end

    def inline_config
      config.collect { |k, v|
        "#{k} #{v}"
      }.join("\n")
    end

    def start
      %x{echo "#{inline_config}" | redis-server -}
      pid
    end

    def stop_redis_instance
      Process.kill("QUIT", pid) if pid?
    end

    def cleanup_files
      File.delete(config[:pidfile])
      File.delete(config[:unixsocket])
    end

    def running?
      %x{redis-cli -s #{config[:unixsocket]} PING 2>&1}.include?("PONG")
    end

    def stop
      stop_redis_instance and
      cleanup_files and
      true
    end

    def socket
      "unix://#{config[:unixsocket]}"
    end

    def pid?
      File.exists?(config[:pidfile])
    end

    def pid
      if pid?
        File.read(config[:pidfile]).chomp.to_i
      end
    end
  end
end
