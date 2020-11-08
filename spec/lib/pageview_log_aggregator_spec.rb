# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogAnalyser::PageviewsLogAggregator do
  subject(:under_test) { described_class.new(file_name) }
  let(:file) { load_logfile(file_name) }
  let(:file_name) { 'default' }
  let(:file_exists?) { true }
  let(:all_results) do
    {
      '/page1' => 2,
      '/page2' => 1,
      '/page3' => 5
    }
  end
  let(:unique_results) do
    {
      '/page1' => 2,
      '/page2' => 1,
      '/page3' => 3
    }
  end

  before do
    allow(File).to receive(:exist?).and_return(file_exists?)
    allow(File).to receive(:open).and_return(file)
  end

  describe '#all' do
    it 'returns pageview count hash for given logfile path' do
      expect(under_test.all).to eq(all_results)
    end
  end

  describe '#unique' do
    it 'returns unique pageview count hash for given logfile path' do
      expect(under_test.unique).to eq(unique_results)
    end
  end

  context 'when file does not exist' do
    let(:file_exists?) { false }

    it 'returns error if logfile path is invalid' do
      expect { under_test.all }.to raise_error LogAnalyser::Parser::FileNotFoundError
    end
  end
end
