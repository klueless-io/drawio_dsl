# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Provides base configuration for automatic layouts
    class Layout < Node
      # represents the x coordinate of the top left corner layout area
      # this coordinate is based on the current location of the page
      attr_accessor :anchor_x
      attr_accessor :anchor_y

      def initialize(page, **args)
        @after_init_fired = false

        super(page, **args.merge(classification: :layout_rule))
      end

      def fire_after_init
        return if @after_init_fired

        @after_init_fired = true
        after_init
      end

      def after_init
        @anchor_x ||= page.position_x
        @anchor_y ||= page.position_y
      end

      def to_h
        super.merge(
          anchor_x: anchor_x,
          anchor_y: anchor_y
        )
      end
    end
  end
end
