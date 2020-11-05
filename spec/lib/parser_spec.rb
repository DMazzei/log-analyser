# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Parser do
  let(:file) { load_logfile(file_name) }
  let(:file_name) { 'default' }
  let(:file_exists?) { true }
  let(:entries) do
    {
      '/page1' => %w[0.0.0.0 1.1.1.1],
      '/page2' => %w[2.2.2.2],
      '/page3' => %w[0.0.0.0 1.1.1.1 3.3.3.3 3.3.3.3 3.3.3.3]
    }
  end

  describe '.call' do
    before do
      allow(File).to receive(:exist?).and_return(file_exists?)
      allow(File).to receive(:open).and_return(file)
    end

    it 'receives valid file path and returns parsed data' do
      expect(described_class.call(file_name)).to eq(entries)
    end

    context 'when file does not exist' do
      let(:file_exists?) { false }

      it 'raises an error of type FileNotFoundError' do
        expect {
          described_class.call(file_name)
        }.to raise_error described_class::FileNotFoundError
      end
    end

    context 'when the log file has an unexpected format' do
      let(:file_name) { 'wrong_format' }

      it 'ignores empty lines and other than the first two columns' do
        expect(described_class.call(file_name)).to eq(entries)
      end
    end

    context 'when the log file is empty' do
      let(:file_name) { 'empty' }

      it 'returns an empty hash' do
        expect(described_class.call(file_name)).to eq({})
      end
    end
  end
end
