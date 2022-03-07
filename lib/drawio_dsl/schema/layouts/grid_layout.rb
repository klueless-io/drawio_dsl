# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Provides grid style layouts
    class GridLayout < Layout
      attr_accessor :direction
      attr_accessor :wrap_at
      attr_accessor :grid_size # this is an alternative to grid_w/grid_h
      attr_accessor :grid_w
      attr_accessor :grid_h
      attr_accessor :cell_no
      attr_accessor :h_align
      attr_accessor :v_align

      # rubocop:disable Metrics/CyclomaticComplexity
      def initialize(page, **args)
        @type       = :grid_layout
        @direction  = args[:direction]  || :horizontal
        @wrap_at    = args[:wrap_at]    || 5
        @grid_size  = args[:grid_size]  || 220
        @grid_w     = args[:grid_w]     || grid_size
        @grid_h     = args[:grid_h]     || grid_size
        @h_align    = args[:h_align]    || :center
        @v_align    = args[:v_align]    || :center
        @cell_no    = 1

        super(page, **args)
      end
      # rubocop:enable Metrics/CyclomaticComplexity

      def position_shape(shape)
        fire_after_init

        shape.x = horizontal_shape_alignment(shape)
        shape.y = vertical_shape_alignment(shape)

        # puts '------------------'
        # puts "cell: #{cell_no}"
        # puts "wrap_at: #{wrap_at}"
        # puts "shape-x: #{shape.x}"
        # puts "shape-y: #{shape.y}"
        # puts "page-x: #{page.position_x}"
        # puts "page-y: #{page.position_y}"
        # puts "anchor-x: #{anchor_x}"
        # puts "anchor-y: #{anchor_y}"

        move_cell_horizontally if direction == :horizontal
        move_cell_vertically if direction == :vertical
      end

      def to_h
        super.merge(
          direction: direction,
          wrap_at: wrap_at,
          grid_w: grid_w,
          grid_h: grid_h,
          cell_no: cell_no
        )
      end

      private

      # rubocop:disable Metrics/AbcSize
      def horizontal_shape_alignment(shape)
        return page.position_x + ((grid_w - shape.w) / 2)  if h_align == :center
        return page.position_x + (grid_w - shape.w)        if h_align == :right

        page.position_x
      end
      # rubocop:enable Metrics/AbcSize

      # rubocop:disable Metrics/AbcSize
      def vertical_shape_alignment(shape)
        return page.position_y + ((grid_h - shape.h) / 2)  if v_align == :center || v_align == :middle
        return page.position_y + (grid_h - shape.h)        if v_align == :bottom

        page.position_y
      end
      # rubocop:enable Metrics/AbcSize

      def move_cell_horizontally
        if cell_no < wrap_at
          page.position_x += grid_w
          @cell_no += 1
          return
        end

        # Flow down to the next row
        page.position_x = anchor_x
        page.position_y += grid_w
        @cell_no = 1
      end

      def move_cell_vertically
        if cell_no < wrap_at
          page.position_y += grid_h
          @cell_no += 1
          return
        end

        # Flow right to the next column
        page.position_y = anchor_y
        page.position_x += grid_h
        @cell_no = 1
      end
    end
  end
end
