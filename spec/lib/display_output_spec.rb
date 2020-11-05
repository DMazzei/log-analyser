# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DisplayOutput do
  let(:text) { 'just testing' }
  let(:pageviews) { { 'page name' => 3 } }

  let(:line) { '|--------------------------------------------------|' }
  let(:header) { "| #{text.ljust(49)}|" }
  let(:empty) { "| #{'no item found!'.ljust(49)}|" }
  let(:list) { "| #{'page name'.ljust(28, '.')} | #{'3'.ljust(18)}|" }
  let(:table) { "#{line}\n#{header}\n#{line}\n#{list}\n#{line}" }

  it 'prints given title and list correctly formatted' do
    expect($stdout).to receive(:puts).with(table)
    described_class.new.print_table(text, pageviews)
  end

  it 'prints given title formatted as header' do
    expect($stdout).to receive(:puts).with("#{line}\n#{header}")
    described_class.new.print_header(text)
  end

  it 'prints no header if description is not informed' do
    expect($stdout).to receive(:puts).with("#{line}\n#{list}\n#{line}")
    described_class.new.print_table('', pageviews)
  end

  it 'prints message if list is empty' do
    expect($stdout).to receive(:puts).with("#{line}\n#{empty}\n#{line}")
    described_class.new.print_list([])
  end

  it 'prints exception with error formatting' do
    error = StandardError.new('message')
    expect($stdout).to receive(:puts).with("An error occurred:\n>> Type:    StandardError\n>> Message: message")
    described_class.new.print_error(error)
  end

  it 'does not fail if error is nil' do
    expect($stdout).to receive(:puts).with("An error occurred:\n.. but no more information is available ..")
    described_class.new.print_error(nil)
  end
end
