require "unicorn/padrino/version"
require "unicorn"
require "unicorn/launcher"

module PadrinoServer
  # Avoid writing pid file by Padrino::Server because this processing will be executed by Unicorn
  def write_pid
    return if options[:server].to_s == "unicorn" 
    super
  end
end
Padrino::Server.send(:prepend, PadrinoServer)
Padrino::Server::Handlers.insert(Padrino::Server::Handlers.length.pred, :unicorn)

module Rack::Handler
  class Unicorn
    class << self

      DEFAULT_PATHS = %w[config/unicorn.rb config/{env}/unicorn.rb]
      DEFAULT_OPTIONS = { timeout: 31 * 24 * 60 * 60 }
  
      def run(app, options = {})
        unicorn_options = {}
  
        if config_file = detect_configuration_file
          unicorn_options[:config_file] = "#{root}/#{config_file}"
        else
          unicorn_options.merge!(DEFAULT_OPTIONS)
          (unicorn_options[:listeners] = []) << "#{options[:Host]}:#{options[:Port]}"
        end
  
        if options[:daemonize]
          unicorn_options[:pid] = options[:pid]
          ::Unicorn::Launcher.daemonize!(unicorn_options)
        end
        ::Unicorn::HttpServer.new(app, unicorn_options).start.join
      end

      private
  
      def detect_configuration_file
        DEFAULT_PATHS.detect{|path| ::File.exist?("#{root}/#{path.gsub!("{env}", env) || path}") }
      end
  
      def env
        ENV["RACK_ENV"]
      end

      def root
        defined?(PADRINO_ROOT) ? PADRINO_ROOT : File.expand_path(".")
      end
    end
  end

  register :unicorn, Unicorn
end
