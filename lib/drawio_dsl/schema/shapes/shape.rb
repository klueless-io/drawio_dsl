# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Shape is a graphical element, it can be a shape, a text, or a group (todo)
    class Shape < Node
      class << self
        def configure_shape(name)
          raise "Shape #{name} not found in configuration" unless KConfig.configuration.drawio.shapes.members.include?(name)

          config = KConfig.configuration.drawio.shapes[name]

          @shape_defaults = config.clone
        end

        def shape_defaults
          return @shape_defaults if defined? @shape_defaults

          raise 'Shape defaults not configured'
        end
      end

      configure_shape(:shape)

      attr_accessor :theme
      attr_accessor :title

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

      attr_accessor :type
      attr_accessor :x
      attr_accessor :y
      attr_accessor :w
      attr_accessor :h
      attr_accessor :style_modifiers

      def initialize(page, **args)
        args[:classification] = :shape
        super(page, **args)

        apply_defaults(args)
      end

      def shape_defaults
        @shape_defaults ||= self.class.shape_defaults.clone
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def apply_defaults(args)
        @theme            = args[:theme] || page.theme # KConfig.configuration.drawio.themes.sample
        theme_palette     = KConfig.configuration.drawio.palette(theme)
        @title            = args[:title]            || ''

        @white_space      = args[:white_space]      || page.style.white_space # wrap or nil
        @html             = args[:html]             || page.style.html
        @rounded          = args[:rounded]          || page.style.rounded
        @shadow           = args[:shadow]           || page.style.shadow
        @sketch           = args[:sketch]           || page.style.sketch
        @glass            = args[:glass]            || page.style.glass

        @type             = args[:type]             || shape_defaults.type
        @x                = args[:x]                || shape_defaults.x
        @y                = args[:y]                || shape_defaults.y
        @w                = args[:w]                || shape_defaults.w
        @h                = args[:h]                || shape_defaults.h
        @style_modifiers  = args[:style_modifiers]  || shape_defaults.style_modifiers

        @fill_color       = args[:fill_color]       || theme_palette.fill_color
        @stroke_color     = args[:stroke_color]     || theme_palette.stroke_color
        @font_color       = args[:font_color]       || theme_palette.font_color
        @gradient         = args[:gradient]         || theme_palette.gradient
      end

      def style
        key_values = []
        key_values << style_modifiers unless style_modifiers.empty?
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

        key_values.join(';')
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def to_h
        {
          id: id,
          classification: classification,
          type: type,
          x: x,
          y: y,
          w: w,
          h: h,
          style: style
        }
      end

      def debug(format: :detail)
        if format == :detail
          debug_detail({ id: id, classification: classification, type: type })
        else
          debug_row(classification, id, type, x, y, w, h)
        end
      end
    end
  end
end