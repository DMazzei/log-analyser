# frozen_string_literal: true

require_relative 'version'

Gem::Specification.new do |spec|
  spec.name             = 'log-analyser'
  spec.version          = VERSION
  spec.authors          = ['Dan Mazzei']
  spec.email            = ['danielmazzei@gmail.com']
  spec.summary          = 'Log reader and data aggregator for pageviews information.'
  spec.description      = 'Log reader and data aggregator for pageviews information.'
  spec.homepage         = 'https://github.com/DMazzei/log-analyser'
  spec.license          = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  spec.metadata = {
      'homepage_uri'        =>  spec.homepage,
      'source_code_uri'     =>  'https://github.com/DMazzei/log-analyser',
      'changelog_uri'       =>  'https://github.com/DMazzei/log-analyser/blob/master/CHANGELOG',
      'bug_tracker_uri'     =>  'https://github.com/DMazzei/log-analyser/issues',
      'documentation_uri'   =>  'https://www.rubydoc.info/gems/log-analyser'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files            = Dir['lib/**/*']
  spec.extra_rdoc_files = %w(CHANGELOG LICENSE.txt README.md)
  spec.rdoc_options    += [
      '--title', 'Emoticon - emotions in terminal',
      '--main', 'README.md',
      '--line-numbers',
      '--inline-source',
      '--quiet'
  ]
  spec.require_paths    = ['lib']
end
