# frozen_string_literal: true

module Spec
  module Helpers
    def load_logfile(file_name)
      File.open(File.expand_path("../../support/fixtures/#{file_name}.log", __FILE__))
    end
  end
end
