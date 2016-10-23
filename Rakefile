# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

# require "rspec/core/rake_task"
# RSpec::Core::RakeTask.new("spec") do |task|
#   task.verbose = false
# end
task default: %w(spec)

ActionAuthorizer::Application.load_tasks