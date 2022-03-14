# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Create an instance of a HTML formatter on the shape
    class StyleBuilder
      MAPPINGS = {
        margin: 'margin',
        margin_top: 'margin-top',
        margin_bottom: 'margin-bottom',
        margin_left: 'margin-left',
        margin_right: 'margin-right',
        padding: 'padding',
        padding_top: 'padding-top',
        padding_bottom: 'padding-bottom',
        padding_left: 'padding-left',
        padding_right: 'padding-right',
        text_align: 'text-align',
        font_size: 'font-size',
        font_weight: 'font-weight',
        font_style: 'font-style',
        font_family: 'font-family',
        color: 'color'
      }.freeze

      attr_reader :defaults
      attr_reader :custom

      def initialize(**opts)
        @style_parts = []
        @defaults = opts
        @custom = {}
      end

      def customize(**opts)
        @custom = opts

        self
      end

      def style
        build
        @style_parts.join(';')
      end

      def style_attribute
        style_value = style
        style_value.empty? ? nil : " style=\"#{style_value}\""
      end

      private

      def build
        defaults.merge(custom).each do |key, value|
          style_key = MAPPINGS[key]
          @style_parts << "#{style_key}:#{value}" if style_key
        end
      end
    end
  end
end
