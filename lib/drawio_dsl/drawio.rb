# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  class Drawio < KDirector::Directors::BaseDirector
    default_builder_type(DrawioDsl::Builder)

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
    attr_reader :page

    def initialize(parent, **opts)
      super(parent, **opts)

      builder.add_page(**opts)
    end

    def square(**opts)
      builder.add_square(opts)
    end

    def rectangle(**opts)
      builder.add_rectangle(opts)
    end

    def circle(**opts)
      builder.add_circle(opts)
    end

    def process(**opts)
      builder.add_process(opts)
    end

    def ellipse(**opts)
      builder.add_ellipse(opts)
    end
  end
end
