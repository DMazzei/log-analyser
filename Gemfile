# frozen_string_literal: true

source 'https://rubygems.org'

gem 'require_all'
gem 'rake', '~> 12.0'
gem 'bundler'
gem 'echoe'

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
end

gemspec name: 'log-analyser'
