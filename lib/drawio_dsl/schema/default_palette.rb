# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Default Palette contains palette information that can be inherited at each level
    class DefaultPalette
      attr_accessor :fill_color
      attr_accessor :stroke_color
      attr_accessor :font_color
      attr_accessor :gradient

      def initialize(owner, **args, &block)
        @fill_color   = args[:fill_color]
        @stroke_color = args[:stroke_color]
        @font_color   = args[:font_color]
        @gradient     = args[:gradient]

        instance_exec(owner, &block) if block_given?
      end

      def to_h
        {
          fill_color: fill_color,
          stroke_color: stroke_color,
          font_color: font_color,
          gradient: gradient
        }
      end
    end
  end
end
