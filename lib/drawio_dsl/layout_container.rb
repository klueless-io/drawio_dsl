# frozen_string_literal: true

module DrawioDsl
  # The layout engine is responsible for laying out the elements on the page.
  #
  # The layout engine can automatically place elements on the page.
  #
  # It will keep track of layout boundaries, current position and flow direction.
  # Elements are positioned on the page in the order they are added.
  # Row/column flow objects will hold information about horizontal and vertical element padding
  class LayoutContainer
    DEFAULT_DIRECTION       = :vertical
    DEFAULT_PADDING         = 20
    DEFAULT_BOUNDARY_HEIGHT = 800
    DEFAULT_BOUNDARY_WIDTH  = 1000

    attr_reader :engine
    attr_accessor :direction
    attr_accessor :padding

    def initialize(engine, **opts)
      @engine     = engine
      @direction  = opts[:direction] || DEFAULT_DIRECTION
      @padding    = opts[:padding]   || DEFAULT_PADDING
      @boundary   = opts[:boundary]
    end

    def vertical?
      @direction == :vertical
    end

    def horizontal?
      @direction == :horizontal
    end

    attr_writer :boundary

    def boundary
      @boundary ||= (vertical? ? DEFAULT_BOUNDARY_HEIGHT : DEFAULT_BOUNDARY_WIDTH)
    end

    # Place the incoming element by altering it's x, y coordinates based on the rules engine
    def place_element(element)
      place_vertical(element) if vertical?
    end

    def place_vertical(element)
      element.x = engine.x
      element.y = engine.y

      engine.y += (element.h + padding)
    end
  end
end
