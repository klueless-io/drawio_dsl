# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  module DrawioShapes
    # rubocop:disable Metrics/CyclomaticComplexity
    def random(**opts)
      case rand(10)
      when 0
        callout(**opts)
      when 1
        circle(**opts)
      when 2
        cloud(**opts)
      when 3
        diamond(**opts)
      when 4
        ellipse(**opts)
      when 5
        hexagon(**opts)
      when 6
        note(**opts)
      when 7
        process(**opts)
      when 8
        rectangle(**opts)
      when 9
        square(**opts)
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def callout(**opts)
      builder.add_callout(**opts)
    end

    def circle(**opts)
      builder.add_circle(**opts)
    end

    def cloud(**opts)
      builder.add_cloud(**opts)
    end

    def diamond(**opts)
      builder.add_diamond(**opts)
    end

    def ellipse(**opts)
      builder.add_ellipse(**opts)
    end

    def hexagon(**opts)
      builder.add_hexagon(**opts)
    end

    def note(**opts)
      builder.add_note(**opts)
    end

    def process(**opts)
      builder.add_process(**opts)
    end

    def rectangle(**opts)
      builder.add_rectangle(**opts)
    end

    def square(**opts)
      builder.add_square(**opts)
    end
  end
end
