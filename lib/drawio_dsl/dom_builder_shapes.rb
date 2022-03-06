# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
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

    def add_cloud(**opts)
      cloud = DrawioDsl::Schema::Cloud.new(current_page, **opts)
      add_shape(cloud)
    end

    def add_note(**opts)
      note = DrawioDsl::Schema::Note.new(current_page, **opts)
      add_shape(note)
    end

    def add_callout(**opts)
      callout = DrawioDsl::Schema::Callout.new(current_page, **opts)
      add_shape(callout)
    end
  end
end
