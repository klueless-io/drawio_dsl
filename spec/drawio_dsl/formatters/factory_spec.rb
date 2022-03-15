# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::Factory do
  subject { instance }

  let(:instance) { Class.new { extend DrawioDsl::Formatters::Factory } }

  it { is_expected.to respond_to(:format_instance) }

  describe '#FORMATTERS' do
    it { expect(described_class::FORMATTERS).to be_a(Hash) }
  end

  describe '#format_instance' do
    subject { instance.format_instance(type) }

    context 'when invalid type' do
      let(:type) { :invalid }

      it { is_expected.to be_a(DrawioDsl::Formatters::BaseFormatter) }
    end

    context 'when valid type' do
      let(:type) { :class }

      it { is_expected.to be_a(DrawioDsl::Formatters::KlassFormatter) }
    end
  end
end
