# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogAnalyser::UniquePageviews do
  let(:entries) do
    {
      '/page1' => %w[1.1.1.1 1.1.1.1],
      '/page2' => %w[2.2.2.2],
      '/page3' => %w[1.1.1.1 1.1.1.1 3.3.3.3 3.3.3.3 3.3.3.3]
    }
  end

  let(:expected_result) do
    {
      '/page1' => 1,
      '/page2' => 1,
      '/page3' => 2
    }
  end

  describe '.for' do
    it 'returns hash with sorted pageview count considering only unique values for each key' do
      expect(described_class.for(entries)).to eq(expected_result)
    end
  end

  describe '#generate_view_count' do
    it 'returns hash with sorted pageview count considering only unique values for each key' do
      result = described_class.new.generate_view_count(entries)
      expect(result).to eq(expected_result)
    end

    context 'when hash is not valid' do
      let(:entries) { { '/page1' => nil } }

      it 'raises error' do
        expect {
          described_class.new.generate_view_count(entries)
        }.to raise_error NoMethodError
      end
    end
  end
end
