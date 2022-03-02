# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class Drawio < KDirector::Directors::BaseDirector
    default_builder_type(DrawioDsl::DomBuilder)

    def layout(**opts)
      builder.set_layout_engine(**opts)

      self
    end

    def diagram(**opts)
      builder.set_diagram(**opts)

      self
    end

    def page(name = nil, **opts, &block)
      page = DrawioDsl::DrawioPage.new(self, **opts.merge(name: name))
      page.instance_eval(&block) if block_given?

      self
    end
  end

  # DrawioDsl::DrawioPage is created when you call .page on the draw-io DSL.
  class DrawioPage < KDirector::Directors::ChildDirector
    attr_reader :auto_layout
    attr_reader :current_x
    attr_reader :current_y

    def initialize(parent, **opts)
      super(parent, **opts)

      @auto_layout = true
      @current_x = 20
      @current_y = 20

      builder.add_page(**opts)
    end

    def square(**opts)
      opts = attach_xy(**opts)
      builder.add_square(**opts)
      update_layout
    end

    def rectangle(**opts)
      opts = attach_xy(**opts)
      builder.add_rectangle(**opts)
      update_layout
    end

    def circle(**opts)
      opts = attach_xy(**opts)
      builder.add_circle(**opts)
      update_layout
    end

    def process(**opts)
      opts = attach_xy(**opts)
      builder.add_process(**opts)
      update_layout
    end

    def ellipse(**opts)
      opts = attach_xy(**opts)
      builder.add_ellipse(**opts)
      update_layout
    end

    private

    def current_element
      builder.current_element
    end

    # attr_reader :layout_engine
    # set_layout

    # layout.container.place_element(element)

    def update_layout
      return unless auto_layout

      # puts current_element.page.x
      # puts current_element.page.y
      # puts current_element.page.w
      # puts current_element.page.h

      @current_x += current_element.w + 20
      @current_y += current_element.h + 20
    end

    def attach_xy(**opts)
      opts[:x] ||= current_x
      opts[:y] ||= current_y
      opts
    end
  end
end
