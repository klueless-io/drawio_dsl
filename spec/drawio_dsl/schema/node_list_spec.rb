# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::NodeList do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new }
  let(:square) { DrawioDsl::Schema::Square.new(page) }

  it { is_expected.to have_attributes(length: 0) }

  describe '#add' do
    context 'when node is a shape' do
      before { instance.add(square) }

      it { is_expected.to have_attributes(length: 1) }

      context '.shapes' do
        subject { instance.shapes }

        it { is_expected.to eq [square] }
      end

      context '.layouts' do
        subject { instance.layouts }

        it { is_expected.to be_empty }
      end
    end

    context 'when node is a layout' do
      let(:layout) { DrawioDsl::Schema::GridLayout.new(page) }

      before { instance.add(layout) }

      it { is_expected.to have_attributes(length: 1) }

      context '.layouts' do
        subject { instance.layouts }

        it { is_expected.to eq [layout] }
      end

      context '.shapes' do
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
