# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class Drawio < KDirector::Directors::BaseDirector
    default_builder_type(DrawioDsl::DomBuilder)

    def diagram(**opts)
      builder.set_diagram(**opts)

      self
    end

    def page(name = nil, **opts, &block)
      page = DrawioDsl::DrawioPage.new(self, **opts.merge(name: name))
      page.instance_eval(&block) if block_given?

      layout = DrawioDsl::LayoutEngine.new(builder.current_page)
      layout.call
      self
    end

    def apply_layout
      engine = DrawioDsl::LayoutEngine.new(builder.diagram)
      engine.call

      self
    end
  end

  # DrawioDsl::DrawioPage is created when you call .page on the draw-io DSL.
  class DrawioPage < KDirector::Directors::ChildDirector
    include DrawioDsl::DrawioShapes

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

    def layout_rule(**opts)
      builder.add_layout_rule(**opts)
    end

    def grid_layout(**opts)
      builder.add_grid_layout(**opts)
    end

    def flex_layout(**opts)
      builder.add_flex_layout(**opts)
    end
  end
end
