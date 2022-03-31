# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Text represents lines, usually used for drawing a connection between two elements.
    class Line < Shape
      class << self
        attr_reader :default_stroke
        attr_reader :default_design
        attr_reader :default_waypoint

        def configure_as(key, stroke: nil, design: nil, waypoint: :straight)
          configure_shape(key, :line)

          @default_stroke = stroke
          @default_design = design
          @default_waypoint = waypoint
        end
      end

      attr_accessor :source
      attr_accessor :target
      attr_accessor :exit_point         # compass_point1 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :entry_point        # compass_point2 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :start_arrow
      attr_accessor :end_arrow
      attr_accessor :stroke
      attr_accessor :design
      attr_accessor :waypoint

      def apply_defaults(args)
        super(args)

        @source           = args[:source]
        @target           = args[:target]
        @exit_point       = args[:exit_point]       || args[:start_point] || :nw
        @entry_point      = args[:entry_point]      || args[:end_point] || :ne
        @start_arrow      = args[:start_arrow]      || :none
        @end_arrow        = args[:end_arrow]        || :simple
        @stroke           = args[:stroke]           || self.class.default_stroke
        @design           = args[:design]           || self.class.default_design
        @waypoint         = args[:waypoint]         || self.class.default_waypoint || :straight
        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
      end

      def default_configuration
        KConfig.configuration.drawio.shape.default_line
      end

      def add_base_modifiers
        cfg = KConfig.configuration.drawio

        @style_builder.add(cfg.stroke(stroke))
        @style_builder.add(cfg.connector.waypoint(waypoint))
        @style_builder.add(cfg.connector.design(design))
        @style_builder.add(cfg.connector.compass_point(exit_point).exit_modifiers)
        @style_builder.add(cfg.connector.compass_point(entry_point).entry_modifiers)
        @style_builder.add(cfg.connector.arrow(start_arrow).start_modifiers)
        @style_builder.add(cfg.connector.arrow(end_arrow).end_modifiers)
      end
    end
  end
end
