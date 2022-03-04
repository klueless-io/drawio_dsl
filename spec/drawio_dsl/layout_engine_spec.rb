# frozen_string_literal: true

RSpec.describe DrawioDsl::LayoutEngine do
  let(:instance) { described_class.new(**opts) }
  let(:opts) { {} }

  # describe '#initialize' do
  #   subject { instance }

  #   it { is_expected.to be_a(DrawioDsl::LayoutEngine) }

  #   it { is_expected.to have_attributes(margin_left: 20, margin_top: 20, x: 20, y: 20) }

  #   context 'with margin_left' do
  #     let(:opts) { { margin_left: 30 } }

  #     it { is_expected.to have_attributes(margin_left: 30, margin_top: 20, x: 30, y: 20) }
  #   end

  #   context 'with margin_top' do
  #     let(:opts) { { margin_top: 30 } }

  #     it { is_expected.to have_attributes(margin_left: 20, margin_top: 30, x: 20, y: 30) }
  #   end

  #   context 'with margin_left and x' do
  #     let(:opts) { { margin_left: 30, x: 50 } }

  #     it { is_expected.to have_attributes(margin_left: 30, margin_top: 20, x: 50, y: 20) }
  #   end

  #   context 'with margin_top and y' do
  #     let(:opts) { { margin_top: 30, y: 50 } }

  #     it { is_expected.to have_attributes(margin_left: 20, margin_top: 30, x: 20, y: 50) }
  #   end
  # end
end
