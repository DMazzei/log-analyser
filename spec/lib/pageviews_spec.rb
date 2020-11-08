# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogAnalyser::Pageviews do
  let(:entries) do
    {
      '/page1' => %w[0.0.0.0 1.1.1.1],
      '/page2' => %w[2.2.2.2],
      '/page3' => %w[0.0.0.0 1.1.1.1 3.3.3.3 3.3.3.3 3.3.3.3]
    }
  end

  let(:expected_result) do
    {
      '/page1' => 2,
      '/page2' => 1,
      '/page3' => 5
    }
  end

  describe '.for' do
    it 'returns hash with sorted pageview count' do
      expect(described_class.for(entries)).to eq(expected_result)
    end

    context 'when hash is not valid' do
      let(:entries) { { '/page1' => nil } }

      it 'rescues the error and raises InvalidLogEntriesError' do
        expect { described_class.for(entries) }.to raise_error described_class::InvalidLogEntriesError
      end
    end
  end

  describe '#generate_view_count' do
    it 'returns hash with sorted pageview count' do
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
