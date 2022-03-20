# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # HTML builder has methods for common HTML elements that get written sequentially
    class HtmlBuilder
      attr_reader :element_style_defaults

      def initialize(element_style_defaults = {})
        @element_style_defaults = element_style_defaults
      end

      # Access the default styles for a HTML element
      #
      # Formatters can define the defaults styles for HTML elements such as <p>, <h1>, etc.
      def default_for(tag)
        element_style_defaults[tag] || {}
      end

      def style_for(tag, **opts)
        defaults = default_for(tag)
        DrawioDsl::Formatters::StyleBuilder.new(**defaults).customize(**opts).style_attribute
      end

      def empty?
        build_lines.empty?
      end

      def exist?
        !empty?
      end

      def as_html(new_line: false)
        new_line ? build_lines.join("\n") : build_lines.join
      end

      def hr(size: 1)
        add_line("<hr size=\"#{size}\"/>")
      end

      def b(content, **opts)
        add_line("<b#{style_for(:b, **opts)}>#{content}</b>")
      end

      def p(content, **opts)
        # style_parts = %w[margin:0px margin-top:4px]
        # style_parts << "text-align:#{opts[:text_align]}" if opts[:text_align]
        # style=\"#{style_parts.join(';')}\"
        add_line("<p#{style_for(:p, **opts)}>#{content}</p>")
      end

      def h1(content, **opts)
        add_line("<h1#{style_for(:h1, **opts)}>#{content}</h1>")
      end

      def h2(content, **opts)
        add_line("<h2#{style_for(:h2, **opts)}>#{content}</h2>")
      end

      def h3(content, **opts)
        add_line("<h3#{style_for(:h3, **opts)}>#{content}</h3>")
      end

      def h4(content, **opts)
        add_line("<h4#{style_for(:h4, **opts)}>#{content}</h4>")
      end

      def h5(content, **opts)
        add_line("<h5#{style_for(:h5, **opts)}>#{content}</h5>")
      end

      def h6(content, **opts)
        add_line("<h6#{style_for(:h6, **opts)}>#{content}</h6>")
      end

      def li(content, **opts)
        add_line("<li#{style_for(:li, **opts)}>#{content}</li>")
      end

      def ul_s(**opts)
        add_line("<ul#{style_for(:ul, **opts)}>")
      end

      def ul_e(**_opts)
        add_line('</ul>')
      end

      def add_line(line)
        lines << line
      end

      def add_placeholder(group_key)
        lines << group_key
      end

      def group(key)
        groups[key] ||= DrawioDsl::Formatters::HtmlBuilder.new(element_style_defaults)
      end

      def build_lines
        lines.flat_map do |line|
          if line.is_a?(Symbol)
            group(line).build_lines
          else
            line
          end
        end
      end

      private

      def lines
        @lines ||= []
      end

      def groups
        @groups ||= {}
      end
    end
  end
end
