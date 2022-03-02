# frozen_string_literal: true

RSpec.describe DrawioDsl::LayoutEngine do
  let(:instance) { described_class.new(**opts) }
  let(:opts) { {} }

  describe '#initialize' do
    subject { instance }

    it { is_expected.to be_a(DrawioDsl::LayoutEngine) }

    it { is_expected.to have_attributes(margin_left: 20, margin_top: 20, x: 20, y: 20) }

    context 'with margin_left' do
      let(:opts) { { margin_left: 30 } }

      it { is_expected.to have_attributes(margin_left: 30, margin_top: 20, x: 30, y: 20) }
    end

    context 'with margin_top' do
      let(:opts) { { margin_top: 30 } }

      it { is_expected.to have_attributes(margin_left: 20, margin_top: 30, x: 20, y: 30) }
    end

    context 'with margin_left and x' do
      let(:opts) { { margin_left: 30, x: 50 } }

      it { is_expected.to have_attributes(margin_left: 30, margin_top: 20, x: 50, y: 20) }
    end

    context 'with margin_top and y' do
      let(:opts) { { margin_top: 30, y: 50 } }

      it { is_expected.to have_attributes(margin_left: 20, margin_top: 30, x: 20, y: 50) }
    end
  end

  describe '#container (default)' do
    subject { instance.container }

    it { is_expected.to be_a(DrawioDsl::LayoutContainer) }

    it {
      is_expected.to have_attributes(
        direction: DrawioDsl::LayoutContainer::DEFAULT_DIRECTION,
        padding: DrawioDsl::LayoutContainer::DEFAULT_PADDING,
        boundary: DrawioDsl::LayoutContainer::DEFAULT_BOUNDARY_HEIGHT
      )
    }

    it { is_expected.to be_vertical }
    it { is_expected.not_to be_horizontal }

    describe '#go_vertical' do
      before { instance.go_vertical(**opts) }

      it { is_expected.to have_attributes(direction: :vertical, padding: DrawioDsl::LayoutContainer::DEFAULT_PADDING, boundary: DrawioDsl::LayoutContainer::DEFAULT_BOUNDARY_HEIGHT) }

      it { is_expected.to be_vertical }
      it { is_expected.not_to be_horizontal }

      context 'with options' do
        let(:opts) { { padding: 10, boundary: 100 } }

        it { is_expected.to have_attributes(direction: :vertical, padding: 10, boundary: 100) }
      end
    end

    describe '#go_horizontal' do
      before { instance.go_horizontal(**opts) }

      it { is_expected.to have_attributes(direction: :horizontal, padding: DrawioDsl::LayoutContainer::DEFAULT_PADDING, boundary: DrawioDsl::LayoutContainer::DEFAULT_BOUNDARY_WIDTH) }

      it { is_expected.not_to be_vertical }
      it { is_expected.to be_horizontal }

      context 'with options' do
        let(:opts) { { padding: 10, boundary: 100 } }

        it { is_expected.to have_attributes(direction: :horizontal, padding: 10, boundary: 100) }
      end
    end
  end
end
