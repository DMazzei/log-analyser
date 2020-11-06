# frozen_string_literal: true

require 'bundler/setup'
require 'pathname'
require 'require_all'

APP_ROOT = Pathname.new(__dir__).parent
$LOAD_PATH.unshift(File.join(APP_ROOT, '/lib')) unless $LOAD_PATH.include?(File.join(APP_ROOT, '/lib'))

require './version'
require_all './lib'
