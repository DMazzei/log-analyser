# frozen_string_literal: true

require_relative 'parser'
require_relative 'pageviews'
require_relative 'unique_pageviews'

class PageviewsLogAggregator
  def initialize(file_path)
    @file_path = file_path
  end

  def all
    Pageviews.for(entries)
  end

  def unique
    UniquePageviews.for(entries)
  end

  private

  attr_accessor :file_path

  def entries
    @entries ||= Parser.call(file_path)
  end
end
