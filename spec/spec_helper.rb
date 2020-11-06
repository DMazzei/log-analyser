# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require_relative '../config/environment'
require 'simplecov'
require 'simplecov-lcov'
require 'coveralls'

Dir['spec/support/**/*.rb'].each { |path| require File.expand_path(path) }

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.minimum_coverage 95

SimpleCov.start do
  enable_coverage :branch
end

Coveralls.wear!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Spec::Helpers
end
