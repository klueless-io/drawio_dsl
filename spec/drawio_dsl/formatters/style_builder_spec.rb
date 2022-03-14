# frozen_string_literal: true

RSpec.describe DrawioDsl::Formatters::StyleBuilder do
  subject { instance }

  let(:instance) { described_class.new }

  describe '#MAPPINGS' do
    subject { described_class::MAPPINGS }

    it { is_expected.to be_a(Hash) }
  end

  context '#initialize' do
    it { expect(instance).to be_a(described_class) }

    describe '.style' do
      subject { instance.style }

      it { is_expected.to be_empty }
    end

    describe '#defaults' do
      subject { instance.defaults }

      it { is_expected.to be_empty }
    end
  end

  context 'when defaults provided' do
    let(:instance) { described_class.new(**defaults) }
    let(:defaults) { { margin: '0px', margin_top: '4px', text_align: :right } }

    describe '.style' do
      subject { instance.style }

      it { is_expected.to eq('margin:0px;margin-top:4px;text-align:right') }

      context 'custom styles applied' do
        let(:instance) { described_class.new(**defaults).customize(margin: '1px', margin_top: '8px') }

        it { is_expected.to eq('margin:1px;margin-top:8px;text-align:right') }
      end
    end

    describe '#style_attribute' do
      subject { instance.style_attribute }

      it { is_expected.to eq(' style="margin:0px;margin-top:4px;text-align:right"') }
    end
  end

  context 'when no defaults provided' do
    let(:instance) { described_class.new }

    describe '.style' do
      subject { instance.style }

      context 'custom styles applied' do
        let(:instance) { described_class.new.customize(margin: '1px', margin_top: '8px', text_align: :center) }

        it { is_expected.to eq('margin:1px;margin-top:8px;text-align:center') }
      end
    end
  end
end
