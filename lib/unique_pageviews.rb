# frozen_string_literal: true

module LogAnalyser
  class UniquePageviews < Pageviews
    def generate_view_count(entries)
      entries.transform_values { |value| value.uniq.size }
             .sort_by(&:last)
             .reverse
             .to_h
    end
  end
end
