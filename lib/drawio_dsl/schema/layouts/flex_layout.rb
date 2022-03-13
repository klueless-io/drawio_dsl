# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Provides flex style layouts
    class FlexLayout < Layout
      attr_accessor :direction
      attr_accessor :wrap_at
      attr_reader :gap
      attr_reader :perpendicular_max

      def initialize(page, **args)
        @direction = args[:direction] || :horizontal
        @wrap_at = args[:wrap_at] || (direction == :horizontal ? 1000 : 800)
        @gap = args[:gap] || 20
        @perpendicular_max = 0

        super(page, **args.merge(type: :flex_layout))
      end

      def position_shape(shape)
        fire_after_init

        position_shape_horizontally(shape) if direction == :horizontal
        position_shape_vertically(shape) if direction == :vertical
      end

      def to_h
        fire_after_init

        super.merge(
          direction: direction,
          wrap_at: wrap_at,
          boundary: boundary,
          perpendicular_max: perpendicular_max
        )
      end

      private

      # rubocop:disable Metrics/AbcSize
      def position_shape_horizontally(shape)
        boundary_violation = page.position_x + shape.w + gap > boundary

        if boundary_violation
          page.position_x = anchor_x
          page.position_y += perpendicular_max
        end

        shape.x = page.position_x
        shape.y = page.position_y

        return if boundary_violation

        page.position_x += shape.w + gap
        @perpendicular_max = [perpendicular_max, shape.h].max
      end
      # rubocop:enable Metrics/AbcSize

      # rubocop:disable Metrics/AbcSize
      def position_shape_vertically(shape)
        boundary_violation = page.position_y + shape.h + gap > boundary

        if boundary_violation
          page.position_y = anchor_y
          page.position_x += perpendicular_max
        end

        shape.x = page.position_x
        shape.y = page.position_y

        return if boundary_violation

        page.position_y += shape.h + gap
        @perpendicular_max = [perpendicular_max, shape.w].max
      end
      # rubocop:enable Metrics/AbcSize

      def boundary
        return @boundary if defined? @boundary

        @boundary = wrap_at + (direction == :horizontal ? anchor_x : anchor_y)
      end
    end
  end
end
