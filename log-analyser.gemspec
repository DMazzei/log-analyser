# frozen_string_literal: true

require_relative 'version'

Gem::Specification.new do |spec|
  spec.name          = 'log-analyser'
  spec.version       = VERSION
  spec.authors       = ['Dan Mazzei']
  spec.email         = ['danielmazzei@gmail.com']

  spec.summary       = 'Log reader and data aggregator for pageviews information.'
  spec.description   = 'Log reader and data aggregator for pageviews information.'
  spec.homepage      = 'https://github.com/DMazzei/log-analyser'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  # spec.metadata['allowed_push_host'] = "'TODO: Set to 'http://mygemserver.com''"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata['source_code_uri'] = "'TODO: Put your gem's public repo URL here.'"
  # spec.metadata['changelog_uri'] = "'TODO: Put your gem's CHANGELOG.md URL here.'"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = %w(.ruby-version CHANGELOG Gemfile Gemfile.lock Guardfile LICENSE.txt Manifest README.md Rakefile bin/setup config/environment.rb lib/pageviews.rb lib/pageviews_log_aggregator.rb lib/parser.rb lib/unique_pageviews.rb log-analyser.gemspec version.rb)
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
