# frozen_string_literal: true

class Parser
  class FileNotFoundError < StandardError
    def initialize(path)
      super("File not found for path: [#{path}]")
    end
  end

  def self.call(file_path)
    new.call(file_path)
  end

  def call(file_path)
    raise FileNotFoundError, file_path unless File.exist?(file_path)

    data = File.open(file_path).map(&:strip)
    data.reject!(&:empty?)
    parse(data)
  end

  private

  def parse(data)
    entries = Hash.new { |h, k| h[k] = [] }
    data.each do |entry|
      key, value = *entry.split(/\s+/)
      entries[key] << value
    end

    entries
  end
end
