# frozen_string_literal: true

module DrawioDsl
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
