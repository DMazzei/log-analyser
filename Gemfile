# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bundler'
gem 'rake', '~> 12.0'
gem 'require_all'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'pry'
end

group :test do
  gem 'wwtd'
end

group :development, :test do
  gem 'rspec', '~> 3.8'
  gem 'rubocop', require: false
  gem 'simplecov', require: false
  gem 'coveralls', require: false
  gem 'rspec_junit_formatter'
  gem 'simplecov-lcov'
end

gemspec name: 'log-analyser'
