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
      attr_accessor :c1       # compass_point1 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :c2       # compass_point2 = :n, :ne, :e, :se, :s, :sw, :w, :nw
      attr_accessor :stroke
      attr_accessor :design

      # rubocop:disable Metrics/AbcSize
      def apply_defaults(args)
        super(args)

        @source           = args[:source]
        @target           = args[:target]
        @c1               = args[:c1]               || :nw
        @c2               = args[:c2]               || :ne
        @stroke           = args[:stroke]           || self.class.default_stroke
        @design           = args[:design]           || self.class.default_design
        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
      end
      # rubocop:enable Metrics/AbcSize

      def default_configuration
        KConfig.configuration.drawio.shape.default_line
      end

      def base_modifiers
        return @base_modifiers if defined? @base_modifiers

        stroke_modifiers = KConfig.configuration.drawio.stroke(stroke)
        design_modifiers = KConfig.configuration.drawio.connector.design(design)

        @base_modifiers = [stroke_modifiers, design_modifiers].reject(&:empty?).join(';')
      end
    end
  end
end
