# frozen_string_literal: true

# Work with HTML formatters to DrawIO shapes
module DrawioDsl
  # HTML formatters can be used on shapes to render HTML using a DSL
  module Formatters
    # Base for any HTML formatter
    class BaseFormatter
      attr_reader :html

      # items are separate to html and are used for building a hash for export
      attr_reader :items

      def initialize(element_style_defaults = {})
        @html = DrawioDsl::Formatters::HtmlBuilder.new(element_style_defaults)
        @items = []
      end

      def hr(size: 1)
        html.hr(size: size)
        items << { type: :hr }

        self
      end

      def b(content, **opts)
        html.b(content, **opts)
        items << { type: :b, content: content }

        self
      end

      def p(content, **opts)
        html.p(content, **opts)
        items << { type: :p, content: content }

        self
      end

      def h1(content, **opts)
        html.h1(content, **opts)
        items << { type: :h1, content: content }

        self
      end

      def h2(content, **opts)
        html.h2(content, **opts)
        items << { type: :h2, content: content }

        self
      end

      def h3(content, **opts)
        html.h3(content, **opts)
        items << { type: :h3, content: content }

        self
      end

      def h4(content, **opts)
        html.h4(content, **opts)
        items << { type: :h4, content: content }

        self
      end

      def h5(content, **opts)
        html.h5(content, **opts)
        items << { type: :h5, content: content }

        self
      end

      def h6(content, **opts)
        html.h6(content, **opts)
        items << { type: :h6, content: content }

        self
      end

      def ul_s(**opts)
        html.ul_s(**opts)

        self
      end

      def ul_e(**opts)
        html.ul_e(**opts)

        self
      end

      def li(content, **opts)
        html.li(content, **opts)

        self
      end

      def empty?
        html.empty?
      end

      def as_html(new_line: false)
        html.as_html(new_line: new_line)
      end

      def to_h
        {
          items: items.map(&:to_h)
        }
      end

      private

      # useful defaults

      def ratio
        @ratio ||= 1.2
      end

      def base_margin_bottom
        @base_margin_bottom ||= 4
      end

      def p_margin_bottom
        @p_margin_bottom ||= base_margin_bottom
      end

      def b_margin_bottom
        @b_margin_bottom ||= base_margin_bottom
      end

      def li_margin_bottom
        @li_margin_bottom ||= base_margin_bottom
      end

      def h6_margin_bottom
        @h6_margin_bottom ||= base_margin_bottom
      end

      def h5_margin_bottom
        @h5_margin_bottom ||= h6_margin_bottom * ratio
      end

      def h4_margin_bottom
        @h4_margin_bottom ||= h5_margin_bottom * ratio
      end

      def h3_margin_bottom
        @h3_margin_bottom ||= h4_margin_bottom * ratio
      end

      def h2_margin_bottom
        @h2_margin_bottom ||= h3_margin_bottom * ratio
      end

      def h1_margin_bottom
        @h1_margin_bottom ||= h2_margin_bottom * ratio
      end
    end
  end
end
