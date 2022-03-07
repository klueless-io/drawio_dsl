# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(27)
      when 0
        actor(**opts)
      when 1
        actor2(**opts)
      when 2
        callout(**opts)
      when 3
        callout2(**opts)
      when 4
        callout3(**opts)
      when 5
        callout4(**opts)
      when 6
        circle(**opts)
      when 7
        cloud(**opts)
      when 8
        cross(**opts)
      when 9
        envelop(**opts)
      when 10
        diamond(**opts)
      when 11
        document(**opts)
      when 12
        ellipse(**opts)
      when 13
        hexagon(**opts)
      when 14
        container(**opts)
      when 15
        container2(**opts)
      when 16
        container3(**opts)
      when 17
        container4(**opts)
      when 18
        note(**opts)
      when 19
        process(**opts)
      when 20
        rectangle(**opts)
      when 21
        rectangle2(**opts)
      when 22
        square(**opts)
      when 23
        step(**opts)
      when 24
        tick(**opts)
      when 25
        face(**opts)
      when 26
        triangle(**opts)
      end
    end

    def actor(**opts)
      builder.add_actor(**opts)
    end

    def actor2(**opts)
      builder.add_actor2(**opts)
    end

    def callout(**opts)
      builder.add_callout(**opts)
    end

    def callout2(**opts)
      builder.add_callout2(**opts)
    end

    def callout3(**opts)
      builder.add_callout3(**opts)
    end

    def callout4(**opts)
      builder.add_callout4(**opts)
    end

    def circle(**opts)
      builder.add_circle(**opts)
    end

    def cloud(**opts)
      builder.add_cloud(**opts)
    end

    def cross(**opts)
      builder.add_cross(**opts)
    end

    def envelop(**opts)
      builder.add_envelop(**opts)
    end

    def diamond(**opts)
      builder.add_diamond(**opts)
    end

    def document(**opts)
      builder.add_document(**opts)
    end

    def ellipse(**opts)
      builder.add_ellipse(**opts)
    end

    def hexagon(**opts)
      builder.add_hexagon(**opts)
    end

    def container(**opts)
      builder.add_container(**opts)
    end

    def container2(**opts)
      builder.add_container2(**opts)
    end

    def container3(**opts)
      builder.add_container3(**opts)
    end

    def container4(**opts)
      builder.add_container4(**opts)
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

    def rectangle2(**opts)
      builder.add_rectangle2(**opts)
    end

    def square(**opts)
      builder.add_square(**opts)
    end

    def step(**opts)
      builder.add_step(**opts)
    end

    def tick(**opts)
      builder.add_tick(**opts)
    end

    def face(**opts)
      builder.add_face(**opts)
    end

    def triangle(**opts)
      builder.add_triangle(**opts)
    end
  end
  # :nocov:
end
