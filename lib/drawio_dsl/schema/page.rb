# frozen_string_literal: true

module DrawioDsl
  module Schema
    # Page is a container for nodes
    class Page
      attr_accessor :diagram

      # These transient attributes hold the current x, y location for the last element added to the page
      attr_accessor :position_x
      attr_accessor :position_y

      attr_accessor :id
      attr_accessor :active
      attr_reader :name
      attr_reader :theme
      attr_reader :style
      attr_reader :palette
      attr_reader :margin_left
      attr_reader :margin_top
      attr_reader :nodes

      attr_reader :grid            # grid       = "0"
      attr_reader :grid_size       # gridSize   = "10"
      attr_reader :guides          # guides     = "1"
      attr_reader :tooltips        # tooltips   = "1"
      attr_reader :connect         # connect    = "1"
      attr_reader :arrows          # arrows     = "1"
      attr_reader :fold            # fold       = "1"
      attr_reader :page_no         # page       = "1"
      attr_reader :page_scale      # pageScale  = "1"
      attr_reader :page_width      # pageWidth  = "583"
      attr_reader :page_height     # pageHeight = "827"
      attr_reader :background      # background = "#FFFACD"
      attr_reader :page_shadow     # shadow     = "0"
      attr_reader :math            # math       = "0"

      # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
      def initialize(diagram, **args)
        @diagram = diagram

        @id           = args[:id]
        @active       = args[:active].nil? ? true : !!args[:active]
        @name         = args[:name]
        @theme        = args[:theme] || diagram.theme

        # cursor positioning is used by the layout engine
        @position_x   = 0
        @position_y   = 0

        # settings to support the layout engine
        @margin_left  = args[:margin_left]  || 50
        @margin_top   = args[:margin_top]   || 50

        # settings that live on the drawio page object
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

        @nodes = NodeList.new # []
      end
      # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength

      def active?
        !!@active
      end

      def add_node(node)
        @nodes.add(self, node)
        node
      end

      def as_xml(xml)
        nodes.as_xml(xml)
      end

      def to_h
        {
          id: id,
          name: name,
          position_x: position_x,
          position_y: position_y,
          theme: theme,
          palette: palette.to_h,
          style: style.to_h,
          settings: settings,
          nodes: nodes.to_h
        }
      end

      private

      def settings
        {
          margin_left: margin_left,
          margin_top: margin_top,
          grid: grid,
          grid_size: grid_size,
          guides: guides,
          tooltips: tooltips,
          connect: connect,
          arrows: arrows,
          fold: fold,
          page_no: page_no,
          page_scale: page_scale,
          page_width: page_width,
          page_height: page_height,
          background: background,
          page_shadow: page_shadow,
          math: math
        }
      end
    end
  end
end
