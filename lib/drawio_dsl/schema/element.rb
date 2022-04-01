# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Elements represents some kind of shape such as a Square, Circle, Callout, Actor, etc.
    class Element < Shape
      class << self
        def configure_as(key)
          configure_shape(key, :element)
        end
      end

      # def initialize(page, **args)
      #   args[:classification] = :anchor
      #   super(page, **args)
      # end

      def apply_defaults(args)
        super(args)

        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
        @gradient         = args[:gradient]         || theme_palette.gradient
        @font_color       = args[:font_color]       || theme_palette.font_color
      end

      def default_configuration
        KConfig.configuration.drawio.shape.default_element
      end
    end
  end
end
