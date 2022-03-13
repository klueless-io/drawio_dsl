# frozen_string_literal: true

RSpec.describe DrawioDsl::DrawIoExtensions do
  let(:instance) { described_class.new }

  subject { instance }

  describe '#initialize' do
    it 'should be initialized' do
      expect(subject).to be_a described_class
    end
  end

  describe '#build_extensions' do
    before { instance.build_extensions }

    context '.sections' do
      subject { instance.sections }

      it { is_expected.not_to be_empty }
    end
  end

  describe '#to_h' do
    before { instance.build_extensions }

    subject { instance.to_h }

    it { is_expected.to be_a Hash }
    # it { puts JSON.pretty_generate(subject) }
  end
end
