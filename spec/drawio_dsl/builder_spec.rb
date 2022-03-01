# frozen_string_literal: true

RSpec.describe DrawioDsl::Builder do
  let(:instance) { described_class.new }

  context 'on initialize' do
    describe '.diagram' do
      subject { instance.diagram }

      it { is_expected.not_to be_nil }
    end

    describe '.diagram.host' do
      subject { instance.diagram.host }

      it { is_expected.not_to be_nil }
    end
  end

  describe '#reset' do
    subject { instance }

    before do
      instance.queue_action({ a: 1, b: 2 })
      instance.diagram.host = 'xxxx'
    end

    context 'before reset' do
      describe '.actions' do
        subject { instance.actions }

        it { is_expected.not_to be_empty }

        context 'after reset' do
          before { instance.reset }

          it { is_expected.to be_empty }
        end
      end

      describe '.diagram.host' do
        subject { instance.diagram.host }

        it { is_expected.to eq('xxxx') }

        context 'after reset' do
          before { instance.reset }

          it { is_expected.not_to eq('xxxx') }
        end
      end
    end
  end
end
