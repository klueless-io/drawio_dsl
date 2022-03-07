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
  end

  # DrawioDsl::DrawioPage is created when you call .page on the draw-io DSL.
  class DrawioPage < KDirector::Directors::ChildDirector
    include DrawioDsl::DrawioShapes

    def initialize(parent, **opts)
      super(parent, **opts)

      builder.add_page(**opts)
    end

    def grid_layout(**opts)
      builder.add_grid_layout(**opts)
    end

    def flex_layout(**opts)
      builder.add_flex_layout(**opts)
    end
  end
end
