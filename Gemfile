# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bundler'
gem 'rake', '~> 12.0'
gem 'require_all'

group :development, :test do
  gem 'coveralls_reborn', '~> 0.18.0', require: false
  gem 'rspec', '~> 3.8'
  gem 'rspec_junit_formatter'
  gem 'rubocop', require: false
  gem 'simplecov', require: false
  gem 'simplecov-lcov'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'pry'
end

gemspec name: 'log-analyser'
