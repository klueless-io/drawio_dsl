# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class Builder
    attr_reader :actions
    attr_reader :last_action

    attr_reader :current_page
    attr_reader :current_element

    def initialize
      @actions = []
      @last_action = {}
    end

    def reset
      @actions = []
      @last_action = {}
      set_diagram
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

    def add_element(element)
      @current_element = element

      element.id = "#{current_page.id}-#{current_page.elements.length + 1}" unless element.id

      current_page.elements << element
      @current_element
    end

    def add_square(**opts)
      square = DrawioDsl::Schema::Square.new(current_page, **opts)
      add_element(square)
    end

    def add_rectangle(**opts)
      rectangle = DrawioDsl::Schema::Rectangle.new(current_page, **opts)
      add_element(rectangle)
    end

    def add_circle(**opts)
      circle = DrawioDsl::Schema::Circle.new(current_page, **opts)
      add_element(circle)
    end

    def add_process(**opts)
      process = DrawioDsl::Schema::Process.new(current_page, **opts)
      add_element(process)
    end

    def add_ellipse(**opts)
      ellipse = DrawioDsl::Schema::Ellipse.new(current_page, **opts)
      add_element(ellipse)
    end

    def debug
      puts JSON.pretty_generate(actions)
      puts JSON.pretty_generate(diagram.to_h)
    end
  end
end
