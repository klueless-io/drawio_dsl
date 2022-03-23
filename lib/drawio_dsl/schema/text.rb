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

      def apply_defaults(args)
        super(args)

        @fill_color       = args[:fill_color]
        @stroke_color     = args[:stroke_color]
        @gradient         = args[:gradient]
        @font_color       = args[:font_color] || theme_palette.text_font_color
      end
    end
  end
end
