# frozen_string_literal: true

class Pageviews
  InvalidLogEntriesError = Class.new(StandardError)

  def self.for(entries = {})
    new.generate_view_count(entries)
  rescue StandardError
    raise InvalidLogEntriesError
  end

  def generate_view_count(entries)
    entries
      .transform_values(&:size)
      .sort_by(&:last)
      .reverse
      .to_h
  end
end
