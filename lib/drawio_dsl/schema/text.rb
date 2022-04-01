# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Text represents text shapes such as h1, h2, p, etc.
    class Text < Shape
      class << self
        def configure_as(key)
          configure_shape(key, :text)
        end
      end

      # def initialize(page, **args)
      #   args[:classification] = :text
      #   super(page, **args)
      # end

      def apply_defaults(args)
        super(args)

        @fill_color       = args[:fill_color]
        @stroke_color     = args[:stroke_color]
        @gradient         = args[:gradient]
        @font_color       = args[:font_color] || page.bg_theme_palette.font_color
      end

      def default_configuration
        KConfig.configuration.drawio.shape.default_text
      end
    end
  end
end
