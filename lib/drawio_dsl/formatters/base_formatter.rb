# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Base for any HTML formatter
    class BaseFormatter
      attr_reader :html

      def initialize(element_style_defaults = {})
        @html = DrawioDsl::Formatters::HtmlBuilder.new(element_style_defaults)
      end

      def empty?
        html.empty?
      end

      def as_html(new_line: false)
        html.as_html(new_line: new_line)
      end
    end
  end
end
