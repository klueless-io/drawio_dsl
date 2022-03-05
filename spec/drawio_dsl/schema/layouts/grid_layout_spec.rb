# frozen_string_literal: true

RSpec.describe DrawioDsl::Schema::GridLayout do
  include_context :node_dependencies

  subject { instance }

  let(:instance) { described_class.new(page, **layout_args) }
  let(:layout_args) { {} }

  let(:page_args) { { margin_left: 0, margin_top: 0 } }

  describe '#initialize' do
    context 'when minimal arguments' do
      it do
        is_expected.to have_attributes(
          type: :grid_layout,
          direction: :horizontal,
          wrap_at: 5,
          grid_size: 220,
          h_align: :center,
          v_align: :center,
          cell_no: 1
        )
      end

      # fit { puts JSON.pretty_generate(subject.to_h) }
    end
  end

  context 'when direction is horizontal' do
    let(:layout_args) { { direction: :horizontal, wrap_at: 3, grid_size: 100 } }

    context 'when 0 shape' do
      it { is_expected.to have_attributes(cell_no: 1) }

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
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
      end

      it { is_expected.to have_attributes(cell_no: 2) }

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

    context 'when 2 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      it { is_expected.to have_attributes(cell_no: 3) }

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 200,
            position_y: 0
          )
        end
      end
    end

    context 'when 3 shapes (should have flowed onto new row)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
      end

      it { is_expected.to have_attributes(cell_no: 1) }

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
  end

  context 'when direction is vertical' do
    let(:layout_args) { { direction: :vertical, wrap_at: 3, grid_size: 100 } }

    context 'when 0 shape' do
      it { is_expected.to have_attributes(cell_no: 1) }

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
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
      end

      it { is_expected.to have_attributes(cell_no: 2) }

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

    context 'when 2 shapes' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
      end

      it { is_expected.to have_attributes(cell_no: 3) }

      describe 'position on page' do
        subject { page }

        it do
          is_expected.to have_attributes(
            position_x: 0,
            position_y: 200
          )
        end
      end
    end

    context 'when 3 shapes (should have flowed onto new row)' do
      let(:shape1) { DrawioDsl::Schema::Square.new(page) }
      let(:shape2) { DrawioDsl::Schema::Square.new(page) }
      let(:shape3) { DrawioDsl::Schema::Square.new(page) }

      before do
        instance.position_shape(shape1)
        instance.position_shape(shape2)
        instance.position_shape(shape3)
      end

      it { is_expected.to have_attributes(cell_no: 1) }

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
  end

  context 'when shape is aligned inside a cell' do
    subject { shape }

    let(:shape_args) { { w: 50, h: 50 } }
    let(:shape) { DrawioDsl::Schema::Square.new(page, **shape_args) }

    before do
      instance.position_shape(shape)
    end

    context 'h_align: :center, v_align: :center' do
      let(:layout_args) { { grid_size: 100, h_align: :center, v_align: :center } }

      it { is_expected.to have_attributes(x: 25, y: 25) }
    end

    # top row
    context 'h_align: :left, v_align: :top' do
      let(:layout_args) { { grid_size: 100, h_align: :left, v_align: :top } }

      it { is_expected.to have_attributes(x: 0, y: 0) }
    end
    context 'h_align: :center, v_align: :top' do
      let(:layout_args) { { grid_size: 100, h_align: :center, v_align: :top } }

      it { is_expected.to have_attributes(x: 25, y: 0) }
    end
    context 'h_align: :right, v_align: :top' do
      let(:layout_args) { { grid_size: 100, h_align: :right, v_align: :top } }

      it { is_expected.to have_attributes(x: 50, y: 0) }
    end

    # middle row
    context 'h_align: :left, v_align: :middle' do
      let(:layout_args) { { grid_size: 100, h_align: :left, v_align: :middle } }

      it { is_expected.to have_attributes(x: 0, y: 25) }
    end
    context 'h_align: :center, v_align: :middle' do
      let(:layout_args) { { grid_size: 100, h_align: :center, v_align: :middle } }

      it { is_expected.to have_attributes(x: 25, y: 25) }
    end
    context 'h_align: :right, v_align: :middle' do
      let(:layout_args) { { grid_size: 100, h_align: :right, v_align: :middle } }

      it { is_expected.to have_attributes(x: 50, y: 25) }
    end

    # bottom row
    context 'h_align: :left, v_align: :bottom' do
      let(:layout_args) { { grid_size: 100, h_align: :left, v_align: :bottom } }

      it { is_expected.to have_attributes(x: 0, y: 50) }
    end
    context 'h_align: :center, v_align: :bottom' do
      let(:layout_args) { { grid_size: 100, h_align: :center, v_align: :bottom } }

      it { is_expected.to have_attributes(x: 25, y: 50) }
    end
    context 'h_align: :right, v_align: :bottom' do
      let(:layout_args) { { grid_size: 100, h_align: :right, v_align: :bottom } }

      it { is_expected.to have_attributes(x: 50, y: 50) }
    end
  end
end
