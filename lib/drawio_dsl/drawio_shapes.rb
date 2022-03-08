# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(37)
      when 0
        h1(**opts)
      when 1
        h2(**opts)
      when 2
        h3(**opts)
      when 3
        h4(**opts)
      when 4
        h5(**opts)
      when 5
        h6(**opts)
      when 6
        p(**opts)
      when 7
        actor(**opts)
      when 8
        actor2(**opts)
      when 9
        callout(**opts)
      when 10
        callout2(**opts)
      when 11
        callout3(**opts)
      when 12
        callout4(**opts)
      when 13
        circle(**opts)
      when 14
        cloud(**opts)
      when 15
        cross(**opts)
      when 16
        envelop(**opts)
      when 17
        diamond(**opts)
      when 18
        document(**opts)
      when 19
        ellipse(**opts)
      when 20
        hexagon(**opts)
      when 21
        container(**opts)
      when 22
        container2(**opts)
      when 23
        container3(**opts)
      when 24
        container4(**opts)
      when 25
        note(**opts)
      when 26
        process(**opts)
      when 27
        rectangle(**opts)
      when 28
        rectangle2(**opts)
      when 29
        square(**opts)
      when 30
        step(**opts)
      when 31
        tick(**opts)
      when 32
        face(**opts)
      when 33
        triangle(**opts)
      when 34
        embed_row(**opts)
      when 35
        embed_col50(**opts)
      when 36
        embed_col200(**opts)
      end
    end

    def h1(**opts)
      builder.add_h1(**opts)
    end

    def h2(**opts)
      builder.add_h2(**opts)
    end

    def h3(**opts)
      builder.add_h3(**opts)
    end

    def h4(**opts)
      builder.add_h4(**opts)
    end

    def h5(**opts)
      builder.add_h5(**opts)
    end

    def h6(**opts)
      builder.add_h6(**opts)
    end

    def p(**opts)
      builder.add_p(**opts)
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

    def embed_row(**opts)
      builder.add_embed_row(**opts)
    end

    def embed_col50(**opts)
      builder.add_embed_col50(**opts)
    end

    def embed_col200(**opts)
      builder.add_embed_col200(**opts)
    end
  end
  # :nocov:
end
