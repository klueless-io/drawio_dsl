# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Diagram is the root of the schema, it contains pages
    class Diagram
      attr_accessor :host
      attr_accessor :theme
      attr_accessor :bg_theme
      attr_accessor :style
      attr_accessor :palette
      attr_accessor :pages

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def initialize(**args)
        @host     = args[:host]     || SecureRandom.alphanumeric(3)
        # TODO: assess and resolve this inconsistency
        @theme    = args[:theme]    || KConfig.configuration.drawio.theme.random_background_type
        @bg_theme = args[:bg_theme] || :not_set

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
          @fill_color   ||= diagram.theme_palette.fill_color
          @stroke_color ||= diagram.theme_palette.stroke_color
          @font_color   ||= diagram.theme_palette.font_color
          @gradient     ||= diagram.theme_palette.gradient
        end

        @pages = args[:pages] || []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def theme_palette
        @theme_palette ||= KConfig.configuration.drawio.theme.element(theme)
      end

      def bg_theme_palette
        @bg_theme_palette ||= KConfig.configuration.drawio.theme.background(bg_theme)
      end

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
