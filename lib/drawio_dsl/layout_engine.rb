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
    attr_reader :page

    attr_reader :current_page
    attr_reader :current_layout

    def initialize(page)
      @page = page
    end

    def call
      page.position_x = page.margin_left
      page.position_y = page.margin_top

      page.nodes.all.each do |node|
        traverse_node(node)
      end
    end

    private

    def traverse_node(node)
      process_node(node)
      node.nodes.all.each do |child|
        traverse_node(child)
      end
    end

    def process_node(node)
      case node.classification
      when :layout_rule
        @current_layout = node
      when :shape
        current_layout&.position_shape(node) if %i[element text].include?(node.class.shape_category)
      end
    end
  end
end
