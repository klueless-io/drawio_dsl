# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Text represents lines, usually used for drawing a connection between two elements.
    class Line < Shape
      class << self
        def configure_as(key)
          configure_shape(key, :line)
        end
      end

      attr_accessor :source
      attr_accessor :target

      def apply_defaults(args)
        super(args)

        @source           = args[:source]
        @target           = args[:target]

        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
      end

      def default_configuration
        KConfig.configuration.drawio.shape.default_line
      end
    end
  end
end
