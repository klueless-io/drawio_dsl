# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Configuration container for the DrawIO DSL
  class Configuration
    include DrawioDsl::ConfigurationShapes
    include DrawioDsl::ConfigurationThemes

    include KLog::Logging

    StrokeConfig = Struct.new(:type, :style_modifiers, keyword_init: true)
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

    def stroke(type)
      # if @strokes has key then return it else return default stroke
      return @strokes[type] if @strokes.key?(type)
      return @strokes[:default]
    end

    def strokes
      return @strokes if defined? @strokes
      @strokes = begin
        
      end      

      # @shapes = Shapes.new(
      #   shape: ShapeDefaults.new(type: :shape, category: :element, x: 0, y: 0, w: 20, h: 20, style_modifiers: ''),
      #   {{#each shapes}}
      #   {{snake ./type}}: ShapeDefaults.new(type: :{{snake ./type}}, x: {{./x}}, category: :{{./category}}, y: {{./y}}, w: {{./w}}, h: {{./h}}, style_modifiers: '{{{./style_modifiers}}}'){{#if @last}}{{^}},{{/if}}
      #   {{/each}}
      # )
    end

    def internal_config
      # File.join(File.dirname(__FILE__)
      file = File.join(DrawioDsl::ROOT_PATH, 'configuration.json')

    end

  end
end

KConfig::Configuration.register(:drawio, DrawioDsl::ConfigurationExtension)
