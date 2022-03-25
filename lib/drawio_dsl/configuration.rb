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

    def stroke(key)
      strokes[key] || ''
    end

    def strokes
      return @strokes if defined? @strokes

      @strokes = {}
      source_config['strokes'].each do |stroke|
        @strokes[stroke['key'].to_sym] = stroke['style']
      end

      @strokes
    end

    # need test
    def get_item_by_category(key, category)
      case category
      when :text
        text(key)
      when :line
        line(key)
      else
        element(key)
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

      ElementShapeConfig = Struct.new(:key, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
      LineShapeConfig    = Struct.new(:key, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
      TextShapeConfig    = Struct.new(:key, :x, :y, :w, :h, :style_modifiers, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      # Elements

      def element(key)
        elements[key] || ElementShapeConfig.new(
          key: :square,
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
          @elements[element['key'].to_sym] = ElementShapeConfig.new(
            key: element['key'].to_sym,
            x: element['x'].to_i,
            y: element['y'].to_i,
            w: element['w'].to_i,
            h: element['h'].to_i,
            style_modifiers: element['style_modifiers']
          )
        end

        @elements
      end

      def element_keys
        elements.keys
      end

      def random_element_key
        elements.values.sample.key
      end

      # Lines

      def line(key)
        lines[key] || LineShapeConfig.new(
          key: :solid,
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
          @lines[line['key'].to_sym] = LineShapeConfig.new(
            key: line['key'].to_sym,
            x: line['x'].to_i,
            y: line['y'].to_i,
            w: line['w'].to_i,
            h: line['h'].to_i,
            style_modifiers: line['style_modifiers']
          )
        end

        @lines
      end

      def line_keys
        lines.keys
      end

      def random_line_key
        lines.values.sample.key
      end

      def text(key)
        texts[key] || TextShapeConfig.new(
          key: :p,
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
          @texts[text['key'].to_sym] = TextShapeConfig.new(
            key: text['key'].to_sym,
            x: text['x'].to_i,
            y: text['y'].to_i,
            w: text['w'].to_i,
            h: text['h'].to_i,
            style_modifiers: text['style_modifiers']
          )
        end

        @texts
      end

      def text_keys
        texts.keys
      end

      def random_text_key
        texts.values.sample.key
      end
    end

    # Configuration for line connections between shapes
    class Connector
      attr_reader :source_config

      XyConfig = Struct.new(:x, :y, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      def compass_point(key)
        compass_points[key] || XyConfig.new(x: 0, y: 0)
      end

      def compass_points
        return @compass_points if defined? @compass_points

        @compass_points = {}
        source_config['compass_points'].each do |compass_point|
          @compass_points[compass_point['key'].to_sym] = XyConfig.new(x: compass_point['x'], y: compass_point['y'])
        end

        @compass_points
      end

      def waypoint(key)
        waypoints[key] || ''
      end

      def waypoints
        return @waypoints if defined? @waypoints

        @waypoints = {}
        source_config['waypoints'].each do |waypoint|
          @waypoints[waypoint['key'].to_sym] = waypoint['style']
        end

        @waypoints
      end

      def arrow(key)
        arrows[key] || 'open'
      end

      def arrows
        return @arrows if defined? @arrows

        @arrows = {}
        source_config['arrows'].each do |arrow|
          @arrows[arrow['key'].to_sym] = arrow['style']
        end

        @arrows
      end

      def design(key)
        designs[key] || ''
      end

      def designs
        return @designs if defined? @designs

        @designs = {}
        source_config['designs'].each do |design|
          @designs[design['key'].to_sym] = design['style']
        end

        @designs
      end
    end

    class Theme
      attr_reader :source_config

      BackgroundThemeConfig = Struct.new(:key, :bg_color, :font_color, :favourite, keyword_init: true)
      ElementThemeConfig = Struct.new(:key, :fill_color, :stroke_color, :font_color, :gradient, keyword_init: true)

      def initialize(source_config)
        @source_config = source_config
      end

      def background(key)
        backgrounds[key] || BackgroundThemeConfig.new(
          key: key,
          bg_color: '#000000',
          font_color: '#FFFFFF',
          favourite: false
        )
      end

      def backgrounds
        return @backgrounds if defined? @backgrounds

        @backgrounds = {}
        source_config['backgrounds'].each do |background|
          @backgrounds[background['key'].to_sym] = BackgroundThemeConfig.new(
            key: background['key'].to_sym,
            bg_color: background['bg_color'],
            font_color: background['font_color'],
            favourite: background['favourite'] == 1
          )
        end

        @backgrounds
      end

      def background_keys
        backgrounds.keys
      end

      def favourite_background_keys
        backgrounds.values.select(&:favourite).map(&:key)
      end

      def random_background_key
        backgrounds.values.sample.key
      end

      def element(key)
        elements[key] || ElementThemeConfig.new(
          key: key,
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
          @elements[element['key'].to_sym] = ElementThemeConfig.new(
            key: element['key'].to_sym,
            fill_color: element['fill_color'],
            stroke_color: element['stroke_color'],
            font_color: element['font_color'],
            gradient: element['gradient']
          )
        end

        @elements
      end

      def element_keys
        elements.keys
      end

      def random_element_key
        elements.values.sample.key
      end
    end
  end
end

KConfig::Configuration.register(:drawio, DrawioDsl::ConfigurationExtension)
