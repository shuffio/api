# frozen_string_literal: true

require 'yaml'
require 'erb'
require 'active_record'

config_content = File.read(File.join('config', 'database.yml'))

db_conf = YAML.safe_load(ERB.new(config_content).result)
env = ENV['RACK_ENV'] || 'development'

ActiveRecord::Base.establish_connection db_conf[env]
logger = if %w[development test].include? env
           log_dir = File.join(Dir.getwd, 'log')
           log_file = File.join(log_dir, 'db.log')
           FileUtils.mkdir_p(log_dir)
           Logger.new(File.open(log_file, 'a'))
         else
           Logger.new($stdout)
         end

ActiveRecord::Base.logger = logger

# Middleware
module ActiveRecord
  module Rack
    # ActiveRecord >= 5 removes the Pool management
    class ConnectionManagement
      def initialize(app)
        @app = app
      end

      def call(env)
        response = @app.call(env)
        response[2] = ::Rack::BodyProxy.new(response[2]) do
          ActiveRecord::Base.clear_active_connections!
        end

        response
      rescue StandardError
        ActiveRecord::Base.clear_active_connections!
        raise
      end
    end
  end
end
