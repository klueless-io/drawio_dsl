# frozen_string_literal: true

module DrawioDsl
  # The layout engine is responsible for laying out the elements on the page.
  #
  # The layout engine can automatically place elements on the page.
  #
  # It will keep track of layout boundaries, current position and flow direction.
  # Elements will be placed on the page in the order they are added.
  # Row/column flow objects will hold information about horizontal and vertical element padding
  class LayoutEngine
    attr_reader :diagram

    attr_reader :current_page
    attr_reader :current_layout
    attr_reader :page_margin_top
    attr_reader :page_margin_left
    attr_reader :x
    attr_reader :y

    def initialize(diagram)
      @diagram = diagram
      @x = 0
      @y = 0
    end

    def call
      diagram.pages.each do |page|
        focus_on_page(page)

        apply_layout_to_page(page)
      end
    end

    private

    def focus_on_page(page)
      @current_page   = page
      page.position_x = page.margin_left
      page.position_y = page.margin_top
    end

    def apply_layout_to_page(page)
      page.nodes.each do |node|
        case node.classification
        when :layout_rule
          @current_layout = node
        when :shape
          current_layout.position_shape(node)
        end
        node.debug(format: :row)
      end
    end

    def define_layout_rule(layout_rule)
      layout_rule.debug
    end
  end
end
