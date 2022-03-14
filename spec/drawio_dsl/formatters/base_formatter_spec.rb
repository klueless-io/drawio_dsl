# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::BaseFormatter do
  subject { instance }

  let(:instance) { described_class.new }

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }
  end

  context 'when building some HTML' do
    subject { instance.as_html }

    before do
      instance.html.add_line('<p>')
      instance.html.add_line('hello world')
      instance.html.add_line('</p>')
      instance.html.p('hello world')
    end

    it { is_expected.to eq('<p>hello world</p><p>hello world</p>') }
  end
end
