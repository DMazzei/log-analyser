# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Process logfile and return pageview count', type: :integration do
  subject(:log_aggregator) { LogAnalyser::PageviewsLogAggregator.new(file_path) }
  let(:file_path) { File.expand_path("../../support/fixtures/#{file_name}.log", __FILE__) }
  let(:file_name) { 'e2e' }

  let(:all_results) do
    {
      '/about'       => 19,
      '/home'        => 19,
      '/help_page/1' => 18,
      '/about/2'     => 17,
      '/contact'     => 16,
      '/index'       => 11
    }
  end
  let(:unique_results) do
    {
      '/home'        => 14,
      '/about'       => 13,
      '/about/2'     => 12,
      '/help_page/1' => 12,
      '/contact'     => 10,
      '/index'       => 10
    }
  end

  it 'succeeds' do
    pageview_list = log_aggregator.all
    unique_pageview_list = log_aggregator.unique

    expect(pageview_list).to eq(all_results)
    expect(unique_pageview_list).to eq(unique_results)

    expect(pageview_list.values.first > pageview_list.values.last).to be_truthy
    expect(unique_pageview_list.values.first > unique_pageview_list.values.last).to be_truthy
  end

  context 'when files does not exist' do
    let(:file_name) { 'it_does_not_exist' }

    it 'fails gracefully' do
      expect { log_aggregator.all }.to raise_error LogAnalyser::Parser::FileNotFoundError
    end
  end
end
