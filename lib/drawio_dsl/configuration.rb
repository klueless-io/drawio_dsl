# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Configuration container for the DrawIO DSL
  class Configuration
    extend Forwardable

    include KLog::Logging

    BaseStyle     = Struct.new(:white_space, :html, :rounded, :shadow, :sketch, :glass, keyword_init: true)

    attr_accessor :base_style

    def_delegators :shape, :element, :line, :text

    def initialize
      @base_style = BaseStyle.new(white_space: :wrap, html: 1, rounded: nil, shadow: nil, sketch: nil, glass: nil)
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

    def shape
      @shape ||= Shape.new(source_config['shape'])
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

    class Shape
      attr_reader :source_config

      ElementShapeConfig = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
      LineShapeConfig    = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
      TextShapeConfig    = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      # Elements

      def element(type)
        elements[type] || ElementShapeConfig.new(
          type: :square,
          x: 0,
          y: 0,
          w: 160,
          h: 160,
          style_modifiers: ''
        )
      end

      def elements
        return @elements if defined? @elements

        @elements = {}
        source_config['elements'].each do |element|
          @elements[element['type'].to_sym] = ElementShapeConfig.new(
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

      def element_types
        elements.keys
      end

      def random_element_type
        elements.values.sample.type
      end

      # Lines

      def line(type)
        lines[type] || LineShapeConfig.new(
          type: :solid,
          x: 0,
          y: 0,
          w: 50,
          h: 50,
          style_modifiers: 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
        )
      end

      def lines
        return @lines if defined? @lines

        @lines = {}
        source_config['lines'].each do |line|
          @lines[line['type'].to_sym] = LineShapeConfig.new(
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

      def line_types
        lines.keys
      end

      def random_line_type
        lines.values.sample.type
      end

      def text(type)
        texts[type] || TextShapeConfig.new(
          type: :p,
          x: 0,
          y: 0,
          w: 100,
          h: 50,
          style_modifiers: 'text;fontSize=16;fontStyle=1;fillColor=none'
        )
      end

      # Texts

      def texts
        return @texts if defined? @texts

        @texts = {}
        source_config['texts'].each do |text|
          @texts[text['type'].to_sym] = TextShapeConfig.new(
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

      def text_types
        texts.keys
      end

      def random_text_type
        texts.values.sample.type
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

      BackgroundThemeConfig = Struct.new(:type, :bg_color, :font_color, :favourite, keyword_init: true)
      ElementThemeConfig = Struct.new(:type, :fill_color, :stroke_color, :font_color, :gradient, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      def background(type)
        backgrounds[type] || BackgroundThemeConfig.new(
          type: type,
          bg_color: '#000000',
          font_color: '#FFFFFF',
          favourite: false
        )
      end

      def backgrounds
        return @backgrounds if defined? @backgrounds

        @backgrounds = {}
        source_config['backgrounds'].each do |background|
          @backgrounds[background['type'].to_sym] = BackgroundThemeConfig.new(
            type: background['type'].to_sym,
            bg_color: background['bg_color'],
            font_color: background['font_color'],
            favourite: background['favourite'] == 1
          )
        end

        @backgrounds
      end

      def background_types
        backgrounds.keys
      end

      def favourite_background_types
        backgrounds.values.select(&:favourite).map(&:type)
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
