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
    attr_accessor :margin_left
    attr_accessor :margin_top
    attr_accessor :x
    attr_accessor :y

    def initialize(**opts)
      @margin_left = opts[:margin_left] || 20
      @margin_top  = opts[:margin_top]  || 20
      @x           = opts[:x]           || @margin_left
      @y           = opts[:y]           || @margin_top
    end

    def container
      @container ||= LayoutContainer.new(self)
    end

    def go_vertical(**opts)
      @container = LayoutContainer.new(self, direction: :vertical, **opts)
    end

    def go_horizontal(**opts)
      @container = LayoutContainer.new(self, direction: :horizontal, **opts)
    end

    # # Position the incoming element by altering it's x, y coordinates based on the rules engine
    # def position_element(element)
    #   container.horizontal?
    # end

    # private

    # def position_horizontally(element)

    # end
  end
end
