# frozen_string_literal: true

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rubygems'
require 'rspec/core/rake_task'

# RSpec::Core::RakeTask.new(:spec)
namespace :spec do
  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = Dir['spec/*/**/*_spec.rb']
  end

  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = Dir['spec/*/**/*_spec.rb'].reject { |f| f['/e2e'] }
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/e2e/**/*_spec.rb'
  end
end

task default: :spec
