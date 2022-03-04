# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class DomBuilder
    attr_reader :actions
    attr_reader :last_action

    attr_reader :current_page
    attr_reader :current_layout_rule
    attr_reader :current_shape

    def initialize
      @actions = []
      @last_action = {}
    end

    def reset
      @actions = []
      @last_action = {}
      set_diagram
      # set_layout_engine
    end

    def queue_action(action)
      @actions << action
      @last_action = action
    end

    def set_diagram(**opts)
      @diagram = DrawioDsl::Schema::Diagram.new(**opts)
    end

    def diagram
      return @diagram if defined? @diagram

      set_diagram
    end

    def add_page(**opts)
      @current_page = DrawioDsl::Schema::Page.new(diagram, **opts)

      current_page.id = SecureRandom.alphanumeric(3) unless current_page.id

      diagram.pages << @current_page
      @current_page
    end

    # ----------------------------------------------------------------------
    # Layout provides rules for positioning components
    # ----------------------------------------------------------------------

    def add_grid_layout(**opts)
      rule = DrawioDsl::Schema::GridLayout.new(current_page, **opts)
      add_layout_rule(rule)
    end

    def add_flex_layout(**opts)
      rule = DrawioDsl::Schema::FlexLayout.new(current_page, **opts)
      add_layout_rule(rule)
    end

    def add_layout_rule(rule)
      @current_layout_rule = rule

      rule.id = "rule-#{current_page.nodes.length + 1}" unless rule.id

      current_page.nodes << rule

      rule
    end

    # ----------------------------------------------------------------------
    # Shapes represent visual components
    # ----------------------------------------------------------------------

    def add_shape(shape)
      @current_shape = shape

      shape.id = "#{current_page.id}-#{current_page.nodes.length + 1}" unless shape.id

      current_page.nodes << shape

      shape
    end

    def add_square(**opts)
      square = DrawioDsl::Schema::Square.new(current_page, **opts)
      add_shape(square)
    end

    def add_rectangle(**opts)
      rectangle = DrawioDsl::Schema::Rectangle.new(current_page, **opts)
      add_shape(rectangle)
    end

    def add_circle(**opts)
      circle = DrawioDsl::Schema::Circle.new(current_page, **opts)
      add_shape(circle)
    end

    def add_process(**opts)
      process = DrawioDsl::Schema::Process.new(current_page, **opts)
      add_shape(process)
    end

    def add_ellipse(**opts)
      ellipse = DrawioDsl::Schema::Ellipse.new(current_page, **opts)
      add_shape(ellipse)
    end

    def add_diamond(**opts)
      diamond = DrawioDsl::Schema::Diamond.new(current_page, **opts)
      add_shape(diamond)
    end

    def add_hexagon(**opts)
      add_hexagon = DrawioDsl::Schema::Hexagon.new(current_page, **opts)
      add_shape(add_hexagon)
    end

    def debug
      puts JSON.pretty_generate(actions)
      puts JSON.pretty_generate(diagram.to_h)
    end

    def dom
      diagram.to_h
    end
  end
end
