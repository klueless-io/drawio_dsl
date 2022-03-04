# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Common Style is the reused on Diagram, Page and Shape
    #
    # When styles are not provided at each level, then they will inherit from
    # the parent common style.
    #
    # Shapes will use the common style of their page
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

    # Default Palette contains palette information that can be inherited at each level
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
        @host = args[:host]   || SecureRandom.alphanumeric(3)

        # Apply a random theme to the diagram if none is specified.
        @theme = args[:theme] || KConfig.configuration.drawio.random_theme

        @style = DrawioDsl::Schema::CommonStyle.new(**args) do
          default_style = KConfig.configuration.drawio.base_style

          # Inherit from configured style when specific style not specified.
          @white_space  ||= default_style.white_space
          @html         ||= default_style.html
          @rounded      ||= default_style.rounded
          @shadow       ||= default_style.shadow
          @sketch       ||= default_style.sketch
          @glass        ||= default_style.glass
        end

        @palette = DrawioDsl::Schema::DefaultPalette.new(self, **args) do |diagram|
          theme_palette = KConfig.configuration.drawio.palette(diagram.theme)

          # Inherit from theme when specific palette options are not specified.
          @fill_color   ||= theme_palette.fill_color
          @stroke_color ||= theme_palette.stroke_color
          @font_color   ||= theme_palette.font_color
          @gradient     ||= theme_palette.gradient
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

    # Page is a container for nodes
    class Page
      attr_accessor :diagram

      # These transient attributes hold the current x, y location for the last element added to the page
      attr_accessor :position_x
      attr_accessor :position_y

      attr_accessor :id
      attr_accessor :name
      attr_accessor :theme
      attr_accessor :style
      attr_accessor :palette
      attr_accessor :margin_left
      attr_accessor :margin_top
      attr_accessor :nodes

      # attr_accessor :dx              # dx         = "2636"
      # attr_accessor :dy              # dy         = "2332"
      attr_accessor :grid            # grid       = "0"
      attr_accessor :grid_size       # gridSize   = "10"
      attr_accessor :guides          # guides     = "1"
      attr_accessor :tooltips        # tooltips   = "1"
      attr_accessor :connect         # connect    = "1"
      attr_accessor :arrows          # arrows     = "1"
      attr_accessor :fold            # fold       = "1"
      attr_accessor :page_no         # page       = "1"
      attr_accessor :page_scale      # pageScale  = "1"
      attr_accessor :page_width      # pageWidth  = "583"
      attr_accessor :page_height     # pageHeight = "827"
      attr_accessor :background      # background = "#FFFACD"
      attr_accessor :page_shadow     # shadow     = "0"
      attr_accessor :math            # math       = "0"

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
      def initialize(diagram, **args)
        @diagram = diagram

        @position_x   = 0
        @position_y   = 0

        @id           = args[:id]
        @name         = args[:name]
        @theme        = args[:theme]        || diagram.theme
        @margin_left  = args[:margin_left]  || 50
        @margin_top   = args[:margin_top]   || 50

        @grid         = args[:grid]         || 0
        @grid_size    = args[:grid_size]    || 10
        @guides       = args[:guides]       || 1
        @tooltips     = args[:tooltips]     || 1
        @connect      = args[:connect]      || 1
        @arrows       = args[:arrows]       || 1
        @fold         = args[:fold]         || 1
        @page_no      = args[:page_no]      || 1
        @page_scale   = args[:page_scale]   || 1
        @page_width   = args[:page_width]   || 1169 # A4
        @page_height  = args[:page_height]  || 827  # A4
        @background   = args[:background]   || '#FFFACD'
        @page_shadow  = args[:page_shadow]  || 0
        @math         = args[:math]         || 0

        @style = DrawioDsl::Schema::CommonStyle.new(**args) do
          # Inherit from the diagram style when specific style not specified.
          @white_space  ||= diagram.style.white_space
          @html         ||= diagram.style.html
          @rounded      ||= diagram.style.rounded
          @shadow       ||= diagram.style.shadow
          @sketch       ||= diagram.style.sketch
          @glass        ||= diagram.style.glass
        end

        @palette = DrawioDsl::Schema::DefaultPalette.new(self, **args) do |page|
          theme_palette = KConfig.configuration.drawio.palette(page.theme)

          # Inherit from theme when specific palette options are not specified.
          @fill_color   ||= theme_palette.fill_color
          @stroke_color ||= theme_palette.stroke_color
          @font_color   ||= theme_palette.font_color
          @gradient     ||= theme_palette.gradient
        end

        @nodes = args[:nodes] || []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength

      def to_h
        {
          id: id,
          name: name,
          theme: theme,
          palette: palette.to_h,
          style: style.to_h,
          margin_left: margin_left,
          margin_top: margin_top,
          position_x: position_x,
          position_y: position_y,
          nodes: nodes.map(&:to_h)
        }
      end
    end

    # Node is a base for shapes, connections, positioners and layout rules
    class Node
      attr_accessor :id
      attr_accessor :page
      attr_accessor :classification

      def initialize(page, **args)
        @page = page
        @id = args[:id]
        @classification = args[:classification] || :unknown
      end

      def to_h
        {
          id: id,
          classification: classification
        }
      end

      def debug(format: :detail)
        if format == :detail
          debug_detail(to_h)
        else
          debug_row(classification, id)
        end
      end

      def debug_detail(**key_values)
        key_values.each do |key, value|
          puts "#{key.to_s.ljust(15)}: #{value}"
        end
      end

      # rubocop:disable Metrics/AbcSize, Metrics/ParameterLists
      def debug_row(classification, id, type = nil, x = nil, y = nil, width = nil, height = nil)
        row = []
        row << classification.to_s.ljust(11)
        row << id.to_s.ljust(6)
        row << (type.nil? ? '' : type).to_s.ljust(15)
        row << (x.nil? ? '' : x).to_s.rjust(5)
        row << (y.nil? ? '' : y).to_s.rjust(5)
        row << (width.nil? ? '' : width).to_s.rjust(5)
        row << (height.nil? ? '' : height).to_s.rjust(5)
        puts row.join(' | ')
      end
      # rubocop:enable Metrics/AbcSize, Metrics/ParameterLists
    end

    # Provides base configuration for automatic layouts
    class LayoutRule < Node
      attr_accessor :type

      # represents the x coordinate of the top left corner layout area
      # this coordinate is based on the current location of the page
      attr_accessor :anchor_x
      attr_accessor :anchor_y

      def initialize(page, **args)
        @after_init_fired = false

        super(page, **args.merge(classification: :layout_rule))
      end

      def fire_after_init
        return if @after_init_fired

        @after_init_fired = true
        after_init
      end

      def after_init
        @anchor_x ||= page.position_x
        @anchor_y ||= page.position_y
      end

      def to_h
        super.merge(
          type: type,
          anchor_x: anchor_x,
          anchor_y: anchor_y
        )
      end
    end

    # Provides grid style layouts
    class GridLayout < LayoutRule
      attr_accessor :direction
      attr_accessor :wrap_at
      attr_accessor :grid_size
      attr_accessor :cell_no
      attr_accessor :h_align
      attr_accessor :v_align

      def initialize(page, **args)
        @type       = :grid_layout
        @direction  = args[:direction]  || :horizontal
        @wrap_at    = args[:wrap_at]    || 5
        @grid_size  = args[:grid_size]  || 220
        @h_align    = args[:h_align]    || :center
        @v_align    = args[:v_align]    || :center
        @cell_no    = 1

        super(page, **args)
      end

      def position_shape(shape)
        fire_after_init

        shape.x = horizontal_shape_alignment(shape)
        shape.y = vertical_shape_alignment(shape)

        # puts '------------------'
        # puts "cell: #{cell_no}"
        # puts "wrap_at: #{wrap_at}"
        # puts "shape-x: #{shape.x}"
        # puts "shape-y: #{shape.y}"
        # puts "page-x: #{page.position_x}"
        # puts "page-y: #{page.position_y}"
        # puts "anchor-x: #{anchor_x}"
        # puts "anchor-y: #{anchor_y}"

        move_cell_horizontally if direction == :horizontal
        move_cell_vertically if direction == :vertical
      end

      def to_h
        super.merge(
          direction: direction,
          wrap_at: wrap_at,
          grid_size: grid_size,
          cell_no: cell_no
        )
      end

      private

      # rubocop:disable Metrics/AbcSize
      def horizontal_shape_alignment(shape)
        return page.position_x + ((grid_size - shape.w) / 2)  if h_align == :center
        return page.position_x + (grid_size - shape.w)        if h_align == :right

        page.position_x
      end
      # rubocop:enable Metrics/AbcSize

      # rubocop:disable Metrics/AbcSize
      def vertical_shape_alignment(shape)
        return page.position_y + ((grid_size - shape.h) / 2)  if v_align == :center || v_align == :middle
        return page.position_y + (grid_size - shape.h)        if v_align == :bottom

        page.position_y
      end
      # rubocop:enable Metrics/AbcSize

      def move_cell_horizontally
        if cell_no < wrap_at
          page.position_x += grid_size
          @cell_no += 1
          return
        end

        # Flow down to the next row
        page.position_x = anchor_x
        page.position_y += grid_size
        @cell_no = 1
      end

      def move_cell_vertically
        if cell_no < wrap_at
          page.position_y += grid_size
          @cell_no += 1
          return
        end

        # Flow right to the next column
        page.position_y = anchor_y
        page.position_x += grid_size
        @cell_no = 1
      end
    end

    # Provides flex style layouts
    class FlexLayout < LayoutRule
      attr_accessor :direction
      attr_accessor :wrap_at

      def initialize(page, **args)
        @type = :flex_layout
        @direction = args[:direction] || :horizontal
        @wrap_at = args[:wrap_at] || (direction == :horizontal ? 1000 : 800)

        super(page, **args)
      end

      # rubocop:disable Metrics/AbcSize, Style/GuardClause
      def position_shape(shape)
        fire_after_init

        shape.x = page.position_x
        shape.y = page.position_y

        # Flow down to the next row
        if direction == :horizontal
          if page.position_x + shape.w > boundary
            page.position_x = anchor_x
            page.position_y += grid_size
            @cell_no = 0
          else
            page.position_x += grid_size
          end
        end

        # Flow right to the next column
        if direction == :vertical
          if page.position_y + shape.h > boundary
            page.position_y = anchor_y
            page.position_x += grid_size
            @cell_no = 0
          else
            page.position_y += grid_size
          end
        end
      end
      # rubocop:enable Metrics/AbcSize, Style/GuardClause

      private

      def boundary
        return @boundary if defined? @boundary

        bounds = grid_size * wrap_at
        @boundary = bounds + (direction == :horizontal ? anchor_x : anchor_y)
      end

      def to_h
        super.merge(direction: direction, wrap_at: wrap_at)
      end
    end

    # Shape is a graphical element, it can be a shape, a text, or a group (todo)
    class Shape < Node
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

        apply_defaults(args, KConfig.configuration.drawio.shape)
      end

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      def apply_defaults(args, shape_defaults)
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

    class Square < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.square)
      end
    end

    class Rectangle < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.rectangle)
      end
    end

    class Circle < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.circle)
      end
    end

    class Process < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.process)
      end
    end

    class Ellipse < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.ellipse)
      end
    end

    class Diamond < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.diamond)
      end
    end

    class Hexagon < Shape
      def initialize(page, **args)
        super(page, **args)

        apply_defaults(args, KConfig.configuration.drawio.hexagon)
      end
    end
  end
end
# dx="800" dy="583" background="#FFFACD" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="0" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0"
