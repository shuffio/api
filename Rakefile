# frozen_string_literal: true

require 'rake'

require File.expand_path('config/application', __dir__)

task :environment do
  ENV['RACK_ENV'] ||= 'development'
end

# rspec tasks
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# rubocop tasks
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i[spec rubocop]

# grape-swagger tasks
require 'grape-swagger/rake/oapi_tasks'
GrapeSwagger::Rake::OapiTasks.new(::Api::Base)

# starter tasks
require 'starter/rake/grape_tasks'
Starter::Rake::GrapeTasks.new(::Api::Base)


# ActiveRecord migration tasks
require 'active_record'
include ActiveRecord::Tasks
config_dir = File.expand_path('../config', __FILE__)
config_content = File.join(config_dir, 'database.yml')
DatabaseTasks.env = ENV['RACK_ENV'] || 'development'
DatabaseTasks.database_configuration = YAML.load_file(config_content)
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = File.join('db', 'migrate')

ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym

load 'active_record/railties/databases.rake'
