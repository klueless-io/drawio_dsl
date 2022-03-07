# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Configuration container for the DrawIO DSL
  class Configuration
    include DrawioDsl::ConfigurationShapes
    include DrawioDsl::ConfigurationThemes

    include KLog::Logging

    BaseStyle = Struct.new(:white_space, :html, :rounded, :shadow, :sketch, :glass, keyword_init: true)

    attr_accessor :base_style

    attr_accessor :shapes

    def initialize
      @base_style = BaseStyle.new(white_space: :wrap, html: 1, rounded: nil, shadow: nil, sketch: nil, glass: nil)

      add_shapes
      add_themes
    end

    def palette(theme)
      themes[theme]
    end

    def random_theme
      themes.keys.sample
    end
  end
end

KConfig::Configuration.register(:drawio, DrawioDsl::ConfigurationExtension)
