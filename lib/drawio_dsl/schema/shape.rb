# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Shape is a graphical element, it can be a shape, a text, or a group (todo)
    class Shape < Node
      include DrawioDsl::Formatters::Factory

      class << self
        attr_reader :shape_key
        attr_reader :shape_category
        attr_reader :shape_defaults

        def configure_shape(key, category)
          item_config = KConfig.configuration.drawio.get_item_by_category(key, category)

          if item_config.nil?
            puts "#{key} not found in configuration for category: #{category}"
            return
          end

          @shape_key = key
          @shape_category = category
          @shape_defaults = item_config.clone
        end
      end

      attr_accessor :theme
      attr_accessor :title
      attr_accessor :value

      # The style of the element, these will derive from the page style if not provided
      attr_accessor :white_space
      attr_accessor :html
      attr_accessor :rounded
      attr_accessor :shadow
      attr_accessor :glass
      attr_accessor :sketch

      attr_accessor :fill_color
      attr_accessor :stroke_color
      attr_accessor :font_color
      attr_accessor :gradient

      attr_accessor :x
      attr_accessor :y
      attr_accessor :w
      attr_accessor :h
      attr_accessor :style_modifiers

      def initialize(page, **args, &block)
        args[:classification] = :shape
        super(page, **args)

        apply_defaults(args)

        instance_eval(&block) if block_given?

        @value = formatter.empty? ? title : formatter.as_html
      end

      def shape_defaults
        @shape_defaults ||= self.class.shape_defaults || default_configuration
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def apply_defaults(args)
        @theme            = args[:theme] || page.theme # KConfig.configuration.drawio.themes.sample
        @title            = args[:title]            || ''

        @white_space      = args[:white_space]      || page.style.white_space # wrap or nil
        @html             = args[:html]             || page.style.html
        @rounded          = args[:rounded]          || page.style.rounded
        @shadow           = args[:shadow]           || page.style.shadow
        @sketch           = args[:sketch]           || page.style.sketch
        @glass            = args[:glass]            || page.style.glass

        @key              = args[:key]              || shape_defaults.key
        @x                = args[:x]                || shape_defaults.x
        @y                = args[:y]                || shape_defaults.y
        @w                = args[:w]                || shape_defaults.w
        @h                = args[:h]                || shape_defaults.h
        @style_modifiers  = args[:style_modifiers]  || shape_defaults.style_modifiers
      end

      def format(key = nil)
        key ||= self.class.shape_key
        format_instance(key)
      end

      def style
        key_values = []
        key_values << "whiteSpace=#{white_space}"         if white_space
        key_values << "html=#{html}"                      if html
        key_values << "rounded=#{rounded}"                if rounded
        key_values << "shadow=#{shadow}"                  if shadow
        key_values << "sketch=#{sketch}"                  if sketch
        key_values << "glass=#{glass}"                    if glass
        key_values << "fillColor=#{fill_color}"           if fill_color
        key_values << "strokeColor=#{stroke_color}"       if stroke_color
        key_values << "fontColor=#{font_color}"           if font_color
        key_values << "gradient=#{gradient}"              if gradient
        key_values << base_modifiers unless base_modifiers.empty?
        key_values << style_modifiers unless style_modifiers.empty?

        key_values.join(';')
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def as_xml(xml)
        # log.error category
        # log.error key
        draw_element(xml) if is_a?(Element) || is_a?(Text)
        draw_line(xml)    if is_a?(Line)
      end

      def draw_element(xml)
        xml.mxCell(id: id, value: value, style: style, vertex: 1, parent: parent&.id) do
          xml.mxGeometry(x: x, y: y, width: w, height: h, as: 'geometry')
        end
      end

      def draw_line(xml)
        xml.mxCell(id: id, value: value, style: style, parent: parent&.id, source: source, target: target, edge: 1) do
          xml.mxGeometry(relative: 1, as: 'geometry')
        end
      end

      def to_h
        result = {
          id: id,
          parent_id: parent&.id,
          classification: classification,
          key: key,
          x: x,
          y: y,
          w: w,
          h: h,
          style: style
        }
        result[:nodes] = nodes.to_h if nodes.any?
        result
      end

      def base_modifiers
        @base_modifiers ||= ''
      end

      def theme_palette
        @theme_palette ||= KConfig.configuration.drawio.theme.element(theme)
      end

      # TODO: test
      def bg_theme_palette
        @bg_theme_palette ||= KConfig.configuration.drawio.theme.background(bg_theme)
      end

      # :nocov:
      def debug(format: :detail)
        if format == :detail
          debug_detail({ id: id, classification: classification, key: key })
        else
          debug_row(classification, id, key, x, y, w, h)
        end
      end
      # :nocov:
    end
  end
end
