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

    # rubocop:disable Metrics/CyclomaticComplexity
    def random(**opts)
      case rand(10)
      when 0
        square(**opts)
      when 1
        rectangle(**opts)
      when 2
        circle(**opts)
      when 3
        process(**opts)
      when 4
        ellipse(**opts)
      when 5
        diamond(**opts)
      when 6
        hexagon(**opts)
      when 7
        cloud(**opts)
      when 8
        note(**opts)
      when 9
        callout(**opts)
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def square(**opts)
      builder.add_square(**opts)
    end

    def rectangle(**opts)
      builder.add_rectangle(**opts)
    end

    def circle(**opts)
      builder.add_circle(**opts)
    end

    def process(**opts)
      builder.add_process(**opts)
    end

    def ellipse(**opts)
      builder.add_ellipse(**opts)
    end

    def diamond(**opts)
      builder.add_diamond(**opts)
    end

    def hexagon(**opts)
      builder.add_hexagon(**opts)
    end

    def cloud(**opts)
      builder.add_cloud(**opts)
    end

    def note(**opts)
      builder.add_note(**opts)
    end

    def callout(**opts)
      builder.add_callout(**opts)
    end

    private

    def current_shape
      builder.current_shape
    end
  end
end
