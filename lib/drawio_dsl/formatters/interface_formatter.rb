# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Format the HTML to display an interface on a class diagram
    class InterfaceFormatter < BaseFormatter
      def initialize
        super(
          {
            p: { margin: '0px', margin_left: '4px', margin_bottom: "#{p_margin_bottom}px" },
            b: { margin: '0px', margin_left: '4px', margin_bottom: "#{b_margin_bottom}px" },
            h1: { margin: '0px', margin_left: '4px', margin_bottom: "#{h1_margin_bottom}px" },
            h2: { margin: '0px', margin_left: '4px', margin_bottom: "#{h2_margin_bottom}px" },
            h3: { margin: '0px', margin_left: '4px', margin_bottom: "#{h3_margin_bottom}px" },
            h4: { margin: '0px', margin_left: '4px', margin_bottom: "#{h4_margin_bottom}px" },
            h5: { margin: '0px', margin_left: '4px', margin_bottom: "#{h5_margin_bottom}px" },
            h6: { margin: '0px', margin_left: '4px', margin_bottom: "#{h6_margin_bottom}px" },
            li: { margin: '0px', margin_left: '4px', margin_bottom: "#{li_margin_bottom}px" }
          }
        )
      end

      def header(name, description: nil, interface_type: 'Interface')
        html.p("<i>&lt;&lt; #{interface_type} &gt;&gt;</i>", text_align: :center)
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
