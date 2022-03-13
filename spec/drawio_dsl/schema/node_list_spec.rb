# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::NodeList do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new }
  let(:anchor) { DrawioDsl::Schema::Anchor.new(page) }
  let(:square) { DrawioDsl::Schema::Square.new(page) }

  it { is_expected.to have_attributes(length: 0) }

  it { is_expected.to be_empty }

  describe '#add' do
    context 'when node is a shape' do
      before { instance.add(anchor, square) }

      it { is_expected.to have_attributes(length: 1) }

      describe '.shapes' do
        subject { instance.shapes }

        it { is_expected.to eq [square] }
      end

      describe '.layouts' do
        subject { instance.layouts }

        it { is_expected.to be_empty }
      end

      describe '.empty?' do
        subject { instance.empty? }

        it { is_expected.to be false }
      end
    end

    context 'when node is a layout' do
      let(:layout) { DrawioDsl::Schema::GridLayout.new(page) }

      before { instance.add(anchor, layout) }

      it { is_expected.to have_attributes(length: 1) }

      describe '.layouts' do
        subject { instance.layouts }

        it { is_expected.to eq [layout] }
      end

      describe '.shapes' do
        subject { instance.shapes }

        it { is_expected.to be_empty }
      end
    end
  end

  describe '.to_h' do
    subject { instance.to_h }

    it { is_expected.not_to be_nil }
  end
end
