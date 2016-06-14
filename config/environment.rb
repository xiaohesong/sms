# Load the application
env = (ENV['RACK_ENV'] ||= 'development')
require File.expand_path('../application', __FILE__)

require 'active_support'
require 'bundler'
Bundler.require :default, env

# Initialize the application

module Sms
  module Application
    include ActiveSupport::Configurable

    class << self
      extend Forwardable

      def_delegators :config, :root, :env, :redis, :logger

      def load_tasks(app=self)
        require "rake"
        run_tasks_blocks(app)
        self
      end

      protected

      def run_tasks_blocks(*) 
        Dir["lib/tasks/**/*.rake"].sort.each { |ext| load(ext) }
      end
    end

  end
end

Logger.class_eval { alias :write :'<<' }

Sms::Application.configure do |config|
  config.root     = File.join(File.dirname(__FILE__).split('/')[0..-2]) 
  config.env      = ActiveSupport::StringInquirer.new(env.to_s)
  config.redis    = nil
  config.logger   = Logger.new(File.join(Sms::Application.root, "log", "#{Sms::Application.env}.log"))
end

specific_environment = "/environments/#{Sms::Application.env}.rb"
require specific_environment if File.exists? specific_environment
Dir["config/initializers/*.rb"].sort.each {|f| require File.expand_path(f)}
