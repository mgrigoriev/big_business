# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'sass-rails', '~> 6'
gem 'webpacker', '~> 4.2'
gem 'jbuilder', '~> 2.7'
gem 'ajax-datatables-rails'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'hamlit'
gem 'simple_form'
gem 'friendly_id'
gem 'devise'
gem 'draper'
gem 'gon'

gem 'faker'
gem 'annotate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'meta_request'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
  gem 'scss_lint', require: false
  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec_junit_formatter'
end
