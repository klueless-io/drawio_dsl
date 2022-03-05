# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Common Style is the reused on Diagram, Page and Shape
    #
    # When styles are not provided at each level, then they will inherit from
    # the parent common style.
    #
    # Shapes will use the common style of their page
    class CommonStyle
      attr_accessor :white_space
      attr_accessor :html
      attr_accessor :rounded
      attr_accessor :shadow
      attr_accessor :glass
      attr_accessor :sketch

      def initialize(**args, &block)
        @white_space      = args[:white_space]
        @html             = args[:html]
        @rounded          = args[:rounded]
        @shadow           = args[:shadow]
        @sketch           = args[:sketch]
        @glass            = args[:glass]

        instance_eval(&block) if block_given?
      end

      def to_h
        {
          white_space: white_space,
          html: html,
          rounded: rounded,
          shadow: shadow,
          sketch: sketch,
          glass: glass
        }
      end
    end
  end
end
