# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Common Style is the reused on Diagram, Page and Element
    #
    # When styles are not provided at each level, then they will inherit from
    # the parent common style.
    #
    # Elements will use the common style of their page
    class CommonStyle
      attr_accessor :theme
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

    class DefaultPalette
      attr_accessor :fill_color
      attr_accessor :stroke_color
      attr_accessor :font_color
      attr_accessor :gradient

      def initialize(owner, **args, &block)
        @fill_color   = args[:fill_color]
        @stroke_color = args[:stroke_color]
        @font_color   = args[:font_color]
        @gradient     = args[:gradient]

        instance_exec(owner, &block) if block_given?
      end

      def to_h
        {
          fill_color: fill_color,
          stroke_color: stroke_color,
          font_color: font_color,
          gradient: gradient
        }
      end
    end

    # Diagram is the root of the schema, it contains pages
    class Diagram
      attr_accessor :host
      attr_accessor :theme
      attr_accessor :style
      attr_accessor :palette
      attr_accessor :pages

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def initialize(**args)
        @host = args[:host] || SecureRandom.alphanumeric(3)

        # Apply a random theme to the diagram if none is specified.
        @theme = args[:theme] || KConfig.configuration.drawio.random_theme

        @style = DrawioDsl::Schema::CommonStyle.new(**args) do
          default_style = KConfig.configuration.drawio.base_style

          # Inherit from configured style when specific style not specified.
          @white_space ||= default_style.white_space
          @html ||= default_style.html
          @rounded ||= default_style.rounded
          @shadow ||= default_style.shadow
          @sketch ||= default_style.sketch
          @glass ||= default_style.glass
        end

        @palette = DrawioDsl::Schema::DefaultPalette.new(self, **args) do |diagram|
          theme_palette = KConfig.configuration.drawio.palette(diagram.theme)

          # Inherit from theme when specific palette options are not specified.
          @fill_color ||= theme_palette.fill_color
          @stroke_color ||= theme_palette.stroke_color
          @font_color ||= theme_palette.font_color
          @gradient ||= theme_palette.gradient
        end

        @pages = args[:pages] || []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def to_h
        {
          host: host,
          theme: theme,
          palette: palette.to_h,
          style: style.to_h,
          pages: pages.map(&:to_h)
        }
      end
    end

    # Page is a container for elements
    class Page
      attr_accessor :diagram

      attr_accessor :id
      attr_accessor :name
      attr_accessor :theme
      attr_accessor :style
      attr_accessor :palette
      attr_accessor :elements

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def initialize(diagram, **args)
        @diagram = diagram

        @id = args[:id]
        @name = args[:name]
        @theme = args[:theme] || diagram.theme

        @style = DrawioDsl::Schema::CommonStyle.new(**args) do
          # Inherit from the diagram style when specific style not specified.
          @white_space ||= diagram.style.white_space
          @html ||= diagram.style.html
          @rounded ||= diagram.style.rounded
          @shadow ||= diagram.style.shadow
          @sketch ||= diagram.style.sketch
          @glass ||= diagram.style.glass
        end

        @palette = DrawioDsl::Schema::DefaultPalette.new(self, **args) do |page|
          theme_palette = KConfig.configuration.drawio.palette(page.theme)

          # Inherit from theme when specific palette options are not specified.
          @fill_color ||= theme_palette.fill_color
          @stroke_color ||= theme_palette.stroke_color
          @font_color ||= theme_palette.font_color
          @gradient ||= theme_palette.gradient
        end

        @elements = args[:elements] || []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

      def to_h
        {
          id: id,
          name: name,
          theme: theme,
          palette: palette.to_h,
          style: style.to_h,
          elements: elements.map(&:to_h)
        }
      end
    end

    # Element is a graphical element, it can be a shape, a text, or a group (todo)
    class Element
      attr_accessor :page

      attr_accessor :theme

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

      attr_accessor :id
      attr_accessor :type
      attr_accessor :x
      attr_accessor :y
      attr_accessor :w
      attr_accessor :h
      attr_accessor :style_modifiers

      def initialize(page, **args)
        @page = page
        @id = args[:id]

        apply_defaults(args, KConfig.configuration.drawio.element)
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def apply_defaults(args, element_defaults)
        @theme            = args[:theme]            || page.theme # KConfig.configuration.drawio.themes.sample
        theme_palette     = KConfig.configuration.drawio.palette(page.theme)

        @white_space      = args[:white_space]      || page.style.white_space # wrap or nil
        @html             = args[:html]             || page.style.html
        @rounded          = args[:rounded]          || page.style.rounded
        @shadow           = args[:shadow]           || page.style.shadow
        @sketch           = args[:sketch]           || page.style.sketch
        @glass            = args[:glass]            || page.style.glass

        @type             = args[:type]             || element_defaults.type
        @x                = args[:x]                || element_defaults.x
        @y                = args[:y]                || element_defaults.y
        @w                = args[:w]                || element_defaults.w
        @h                = args[:h]                || element_defaults.h
        @style_modifiers  = args[:style_modifiers]  || element_defaults.style_modifiers

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
          type: type,
          x: x,
          y: y,
          w: w,
          h: h,
          style: style
        }
      end
    end

    # Graphical element in the shape of a square
    class Square < Element
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.square)
      end
    end

    # Graphical element in the shape of a rectangle
    class Rectangle < Element
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.rectangle)
      end
    end

    # Graphical element in the shape of a circle
    class Circle < Element
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.circle)
      end
    end

    # Graphical element in the shape of an rectangle with to vertical lines
    class Process < Element
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.process)
      end
    end

    # Graphical element in the shape of an ellipse
    class Ellipse < Element
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.ellipse)
      end
    end
  end
end
# dx="800" dy="583" background="#FFFACD" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="0" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0"
