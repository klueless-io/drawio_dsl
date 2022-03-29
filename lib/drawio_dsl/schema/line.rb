# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Text represents lines, usually used for drawing a connection between two elements.
    class Line < Shape
      class << self
        attr_reader :default_stroke
        attr_reader :default_design

        def configure_as(key, stroke: nil, design: nil)
          configure_shape(key, :line)
          @default_stroke = stroke
          @default_design = design
        end
      end

      attr_accessor :source
      attr_accessor :target
      attr_accessor :exit_point         # compass_point1 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :entry_point        # compass_point2 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :stroke
      attr_accessor :design

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity,  Metrics/PerceivedComplexity
      def apply_defaults(args)
        super(args)

        @source           = args[:source]
        @target           = args[:target]
        @exit_point       = args[:exit_point]       || args[:c1] || :nw
        @entry_point      = args[:entry_point]      || args[:c2] || :ne
        log.kv 'exit_point', @exit_point
        log.kv 'entry_point', @entry_point
        @stroke           = args[:stroke]           || self.class.default_stroke
        @design           = args[:design]           || self.class.default_design
        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity,  Metrics/PerceivedComplexity

      def default_configuration
        KConfig.configuration.drawio.shape.default_line
      end

      # rubocop:disable Metrics/AbcSize
      def base_modifiers
        return @base_modifiers if defined? @base_modifiers

        log.kv 'exit_modifier', KConfig.configuration.drawio.connector.compass_point(exit_point).exit_modifiers
        log.kv 'entry_modifier', KConfig.configuration.drawio.connector.compass_point(entry_point).entry_modifiers

        @base_modifiers = [
          KConfig.configuration.drawio.stroke(stroke),
          KConfig.configuration.drawio.connector.design(design),
          KConfig.configuration.drawio.connector.compass_point(exit_point).exit_modifiers,
          KConfig.configuration.drawio.connector.compass_point(entry_point).entry_modifiers
        ].reject(&:empty?).join(';')
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
