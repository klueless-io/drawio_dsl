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
