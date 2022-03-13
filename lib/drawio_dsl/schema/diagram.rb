# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Diagram is the root of the schema, it contains pages
    class Diagram
      attr_accessor :host
      attr_accessor :theme
      attr_accessor :style
      attr_accessor :palette
      attr_accessor :pages

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def initialize(**args)
        @host = args[:host]   || SecureRandom.alphanumeric(3)

        # Apply a random theme to the diagram if none is specified.
        @theme = args[:theme] || KConfig.configuration.drawio.random_theme

        @style = DrawioDsl::Schema::CommonStyle.new(**args) do
          default_style = KConfig.configuration.drawio.base_style

          # Inherit from configured style when specific style not specified.
          @white_space  ||= default_style.white_space
          @html         ||= default_style.html
          @rounded      ||= default_style.rounded
          @shadow       ||= default_style.shadow
          @sketch       ||= default_style.sketch
          @glass        ||= default_style.glass
        end

        @palette = DrawioDsl::Schema::DefaultPalette.new(self, **args) do |diagram|
          theme_palette = KConfig.configuration.drawio.palette(diagram.theme)

          # Inherit from theme when specific palette options are not specified.
          @fill_color   ||= theme_palette.fill_color
          @stroke_color ||= theme_palette.stroke_color
          @font_color   ||= theme_palette.font_color
          @gradient     ||= theme_palette.gradient
        end

        @pages = args[:pages] || []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def to_h
        {
          host: host,
          theme: theme,
          palette: palette.to_h,
          style: style.to_h,
          pages: pages.select(&:active?).map(&:to_h)
        }
      end
    end
  end
end
