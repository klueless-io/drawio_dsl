# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::FlexLayout do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **layout_args) }
  let(:layout_args) { {} }
  let(:page_args) { {} }
  let(:starting_position_x) { 0 }
  let(:starting_position_y) { 0 }

  before do
    page.position_x = starting_position_x
    page.position_y = starting_position_y
    instance.fire_after_init
  end

  describe '#initialize' do
    context 'when minimal arguments' do
      it do
        is_expected.to have_attributes(
          type: :flex_layout,
          direction: :horizontal,
          wrap_at: 1000,
          anchor_x: 0,
          anchor_y: 0
        )
      end

      context 'when direction vertical' do
        let(:layout_args) { { direction: :vertical } }
        it do
          is_expected.to have_attributes(
            type: :flex_layout,
            direction: :vertical,
            wrap_at: 800,
            anchor_x: 0,
            anchor_y: 0
          )
        end
      end
    end
  end

  context 'when direction is horizontal (with no gaps and simulated page margins)' do
    subject { instance.to_h }

    let(:starting_position_x) { 10 }
    let(:starting_position_y) { 10 }

    let(:layout_args) { { direction: :horizontal, wrap_at: 300, gap: 0 } }

    context 'when 0 shape' do
      it do
        is_expected.to include(
          type: :flex_layout,
          direction: :horizontal,
          wrap_at: 300,
          anchor_x: 10,
          anchor_y: 10,
          boundary: 310
        )
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 10
          )
        end
      end
    end

    context 'when 1 shape' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }

      before do
        instance.position_shape(shape1)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 110,
            position_y: 10
          )
        end
      end
    end

    context 'when 2 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 50, h: 100 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 160,
            position_y: 10
          )
        end
      end
    end

    context 'when 3 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 50, h: 100 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w: 50, h: 100 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 210,
            position_y: 10
          )
        end
      end
    end

    context 'when 4 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w:  50, h: 100 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w:  50, h: 100 }) }
      let(:shape4) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
        instance.position_shape(shape4)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 310,
            position_y: 10
          )
        end
      end
    end

    context 'when 5 shapes (boundary violation)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w:  50, h: 100 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w:  50, h: 100 }) }
      let(:shape4) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape5) { DrawioDsl::Schema::Square.new(page, **{ w: 10, h: 100 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
        instance.position_shape(shape4)
        instance.position_shape(shape5)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 110
          )
        end
      end
    end
  end

  context 'when direction is horizontal and there is a gap between elements' do
    subject { instance.to_h }

    let(:layout_args) { { direction: :horizontal, wrap_at: 100, gap: 10 } }

    context 'when 0 shape' do
      it do
        is_expected.to include(
          type: :flex_layout,
          direction: :horizontal,
          wrap_at: 100,
          anchor_x: 0,
          anchor_y: 0,
          boundary: 100
        )
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 0
          )
        end
      end
    end

    context 'when 1 shape' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }

      before do
        instance.position_shape(shape1)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 55,
            position_y: 0
          )
        end
      end
    end

    context 'when 2 shapes (no gaps)' do
      let(:layout_args) { { direction: :horizontal, wrap_at: 100, gap: 0 } }

      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 50, h: 45 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 50, h: 45 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 100,
            position_y: 0
          )
        end
      end
    end

    context 'when 2 shapes (boundary violation)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 45
          )
        end
      end
    end
  end

  context 'when direction is vertical (with no gaps and simulated page margins)' do
    subject { instance.to_h }

    let(:starting_position_x) { 10 }
    let(:starting_position_y) { 10 }

    let(:layout_args) { { direction: :vertical, wrap_at: 300, gap: 0 } }

    context 'when 0 shape' do
      it do
        is_expected.to include(
          type: :flex_layout,
          direction: :vertical,
          wrap_at: 300,
          anchor_x: 10,
          anchor_y: 10,
          boundary: 310
        )
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 10
          )
        end
      end
    end

    context 'when 1 shape' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }

      before do
        instance.position_shape(shape1)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 110
          )
        end
      end
    end

    context 'when 2 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 50 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 160
          )
        end
      end
    end

    context 'when 3 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 210
          )
        end
      end
    end

    context 'when 4 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }
      let(:shape4) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
        instance.position_shape(shape4)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 10,
            position_y: 310
          )
        end
      end
    end

    context 'when 5 shapes (boundary violation)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h:  50 }) }
      let(:shape4) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 100 }) }
      let(:shape5) { DrawioDsl::Schema::Square.new(page, **{ w: 100, h: 10 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
        instance.position_shape(shape4)
        instance.position_shape(shape5)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 110,
            position_y: 10
          )
        end
      end
    end
  end

  context 'when direction is vertical and there is a gap between elements' do
    subject { instance.to_h }

    let(:layout_args) { { direction: :vertical, wrap_at: 100, gap: 10 } }

    context 'when 0 shape' do
      it do
        is_expected.to include(
          type: :flex_layout,
          direction: :vertical,
          wrap_at: 100,
          anchor_x: 0,
          anchor_y: 0,
          boundary: 100
        )
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 0
          )
        end
      end
    end

    context 'when 1 shape' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }

      before do
        instance.position_shape(shape1)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 55
          )
        end
      end
    end

    context 'when 2 shapes (no gaps)' do
      let(:layout_args) { { direction: :vertical, wrap_at: 100, gap: 0 } }

      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 50 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 50 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 100
          )
        end
      end
    end

    context 'when 2 shapes (boundary violation)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page, **{ w: 45, h: 45 }) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 45,
            position_y: 0
          )
        end
      end
    end
  end
end
