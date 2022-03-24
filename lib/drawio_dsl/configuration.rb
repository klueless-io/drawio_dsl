# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Configuration container for the DrawIO DSL
  class Configuration
    include DrawioDsl::ConfigurationShapes

    include KLog::Logging

    BaseStyle     = Struct.new(:white_space, :html, :rounded, :shadow, :sketch, :glass, keyword_init: true)
    ElementConfig = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    LineConfig    = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    TextConfig    = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)

    attr_accessor :base_style

    attr_accessor :shapes

    def initialize
      @base_style = BaseStyle.new(white_space: :wrap, html: 1, rounded: nil, shadow: nil, sketch: nil, glass: nil)

      # TODO: these need to be removed
      add_shapes
    end

    def stroke(type)
      strokes[type] || ''
    end

    def strokes
      return @strokes if defined? @strokes

      @strokes = {}
      source_config['strokes'].each do |stroke|
        @strokes[stroke['type'].to_sym] = stroke['style']
      end

      @strokes
    end

    # need test
    def get_item_by_category(type, category)
      case category
      when :text
        text(type)
      when :line
        line(type)
      else
        element(type)
      end
    end

    def element(type)
      elements[type]
    end

    def elements
      return @elements if defined? @elements

      @elements = {}
      source_config['shapes'].select { |shape| shape['category'] == 'element' }.each do |element|
        @elements[element['type'].to_sym] = ElementConfig.new(
          type: element['type'].to_sym,
          x: element['x'].to_i,
          y: element['y'].to_i,
          w: element['w'].to_i,
          h: element['h'].to_i,
          style_modifiers: element['style_modifiers']
        )
      end

      @elements
    end

    def line(type)
      lines[type]
    end

    def lines
      return @lines if defined? @lines

      @lines = {}
      source_config['shapes'].select { |shape| shape['category'] == 'line' }.each do |line|
        @lines[line['type'].to_sym] = LineConfig.new(
          type: line['type'].to_sym,
          x: line['x'].to_i,
          y: line['y'].to_i,
          w: line['w'].to_i,
          h: line['h'].to_i,
          style_modifiers: line['style_modifiers']
        )
      end

      @lines
    end

    def text(type)
      texts[type]
    end

    def texts
      return @texts if defined? @texts

      @texts = {}
      source_config['shapes'].select { |shape| shape['category'] == 'text' }.each do |text|
        @texts[text['type'].to_sym] = TextConfig.new(
          type: text['type'].to_sym,
          x: text['x'].to_i,
          y: text['y'].to_i,
          w: text['w'].to_i,
          h: text['h'].to_i,
          style_modifiers: text['style_modifiers']
        )
      end

      @texts
    end

    def connector
      @connector ||= Connector.new(source_config['connector'])
    end

    def theme
      @theme ||= Theme.new(source_config['theme'])
    end

    def source_config
      return @source_config if defined? @source_config

      @source_config = begin
        file = File.join(DrawioDsl::ROOT_PATH, 'config/configuration.json')
        JSON.parse(File.read(file))
      end
    end

    # Configuration for line connections between shapes
    class Connector
      attr_reader :source_config

      XyConfig = Struct.new(:x, :y, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      def compass_point(type)
        compass_points[type] || XyConfig.new(x: 0, y: 0)
      end

      def compass_points
        return @compass_points if defined? @compass_points

        @compass_points = {}
        source_config['compass_points'].each do |compass_point|
          @compass_points[compass_point['type'].to_sym] = XyConfig.new(x: compass_point['x'], y: compass_point['y'])
        end

        @compass_points
      end

      def waypoint(type)
        waypoints[type] || ''
      end

      def waypoints
        return @waypoints if defined? @waypoints

        @waypoints = {}
        source_config['waypoints'].each do |waypoint|
          @waypoints[waypoint['type'].to_sym] = waypoint['style']
        end

        @waypoints
      end

      def arrow(type)
        arrows[type] || 'open'
      end

      def arrows
        return @arrows if defined? @arrows

        @arrows = {}
        source_config['arrows'].each do |arrow|
          @arrows[arrow['type'].to_sym] = arrow['style']
        end

        @arrows
      end

      def design(type)
        designs[type] || ''
      end

      def designs
        return @designs if defined? @designs

        @designs = {}
        source_config['designs'].each do |design|
          @designs[design['type'].to_sym] = design['style']
        end

        @designs
      end
    end

    class Theme
      attr_reader :source_config

      BackgroundThemeConfig = Struct.new(:type, :bg_color, :font_color, keyword_init: true)
      ElementThemeConfig = Struct.new(:type, :fill_color, :stroke_color, :font_color, :gradient, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      def background(type)
        backgrounds[type] || BackgroundThemeConfig.new(
          type: type,
          bg_color: '#000000',
          font_color: '#ffffff'
        )
      end

      def backgrounds
        return @backgrounds if defined? @backgrounds

        @backgrounds = {}
        source_config['backgrounds'].each do |background|
          @backgrounds[background['type'].to_sym] = BackgroundThemeConfig.new(
            type: background['type'].to_sym,
            bg_color: background['bg_color'],
            font_color: background['font_color']
          )
        end

        @backgrounds
      end

      def background_types
        backgrounds.keys
      end

      def random_background_type
        backgrounds.values.sample.type
      end

      def element(type)
        elements[type] || ElementThemeConfig.new(
          type: type,
          fill_color: '#ffffff',
          stroke_color: '#000000',
          font_color: '#000000',
          gradient: nil
        )
      end

      def elements
        return @elements if defined? @elements

        @elements = {}
        source_config['elements'].each do |element|
          @elements[element['type'].to_sym] = ElementThemeConfig.new(
            type: element['type'].to_sym,
            fill_color: element['fill_color'],
            stroke_color: element['stroke_color'],
            font_color: element['font_color'],
            gradient: element['gradient']
          )
        end

        @elements
      end

      def element_types
        elements.keys
      end

      def random_element_type
        elements.values.sample.type
      end
    end
  end
end

KConfig::Configuration.register(:drawio, DrawioDsl::ConfigurationExtension)
