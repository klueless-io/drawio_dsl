# frozen_string_literal: true

RSpec.describe DrawioDsl::LayoutContainer do
  let(:engine) { DrawioDsl::LayoutEngine.new }
  let(:instance) { described_class.new(engine, **opts) }
  let(:opts) { {} }

  describe '#initialize' do
    subject { instance }

    it { is_expected.to be_a(DrawioDsl::LayoutContainer) }

    it do
      is_expected.to have_attributes(
        direction: DrawioDsl::LayoutContainer::DEFAULT_DIRECTION,
        padding: DrawioDsl::LayoutContainer::DEFAULT_PADDING,
        boundary: DrawioDsl::LayoutContainer::DEFAULT_BOUNDARY_HEIGHT
      )
    end

    it { is_expected.to be_vertical }
    it { is_expected.not_to be_horizontal }

    context 'with direction' do
      let(:opts) { { direction: :horizontal } }

      it { is_expected.to be_horizontal }

      it do
        is_expected.to have_attributes(
          direction: :horizontal,
          padding: DrawioDsl::LayoutContainer::DEFAULT_PADDING,
          boundary: DrawioDsl::LayoutContainer::DEFAULT_BOUNDARY_WIDTH
        )
      end
    end

    context 'with boundary' do
      let(:opts) { { boundary: 500 } }

      it { is_expected.to have_attributes(boundary: 500) }
    end
  end
end
