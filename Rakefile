# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

if %w[development test].include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task :yarn_lint do
    exit(1) unless system('yarn run lint')
  end

  require 'scss_lint/rake_task'
  SCSSLint::RakeTask.new do |task|
    task.files = [] # hack, otherwise scss_lint doesn't respect scss_files option in .scss-lint.yml
  end

  if ENV['CI']
    task(:spec).clear
    RSpec::Core::RakeTask.new(spec: 'spec:prepare') do |t|
      t.rspec_opts = '--fail-fast=3 --format progress --format RspecJunitFormatter --out tmp/test-results/rspec.xml'
    end
  end

  task(:default).clear
  task default: %i[yarn_lint rubocop scss_lint spec]
end
