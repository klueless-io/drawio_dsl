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

    def connector
      @connector ||= Connector.new(source_config['connector'])
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
  end
end

KConfig::Configuration.register(:drawio, DrawioDsl::ConfigurationExtension)
