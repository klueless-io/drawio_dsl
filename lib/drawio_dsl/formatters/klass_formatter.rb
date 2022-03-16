# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Create an instance of a HTML formatter on the shape
    class KlassFormatter < BaseFormatter
      def initialize
        super({ p: { margin: '0px', margin_left: '4px', margin_top: '4px' } })
      end

      def header(name, description: nil)
        html.p("<b>#{name}</b>", text_align: :center)
        html.hr

        html.group(:description).p(description) if description

        self
      end

      def field(name, type: nil)
        value = if type
                  "#{name}: #{type}"
                else
                  name
                end
        html.group(:fields).p(value)

        self
      end

      def method(name, type: nil)
        value = if type
                  "#{name}() : #{type}"
                else
                  "#{name}()"
                end
        html.group(:methods).p(value)

        self
      end

      def as_html(new_line: false)
        html.add_placeholder(:fields)
        html.add_placeholder(:methods)

        html.group(:fields).hr if html.group(:fields).exist? && html.group(:methods).exist?

        html.as_html(new_line: new_line)
      end
    end
  end
end
