# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(39)
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
        container(**opts)
      when 16
        container2(**opts)
      when 17
        container3(**opts)
      when 18
        container4(**opts)
      when 19
        cross(**opts)
      when 20
        envelop(**opts)
      when 21
        diamond(**opts)
      when 22
        document(**opts)
      when 23
        ellipse(**opts)
      when 24
        hexagon(**opts)
      when 25
        interface(**opts)
      when 26
        klass(**opts)
      when 27
        note(**opts)
      when 28
        process(**opts)
      when 29
        rectangle(**opts)
      when 30
        rectangle2(**opts)
      when 31
        square(**opts)
      when 32
        step(**opts)
      when 33
        tick(**opts)
      when 34
        face(**opts)
      when 35
        triangle(**opts)
      when 36
        embed_row(**opts)
      when 37
        embed_col50(**opts)
      when 38
        embed_col200(**opts)
      end
    end

    def h1(**opts, &block)
      builder.add_h1(**opts, &block)
    end

    def h2(**opts, &block)
      builder.add_h2(**opts, &block)
    end

    def h3(**opts, &block)
      builder.add_h3(**opts, &block)
    end

    def h4(**opts, &block)
      builder.add_h4(**opts, &block)
    end

    def h5(**opts, &block)
      builder.add_h5(**opts, &block)
    end

    def h6(**opts, &block)
      builder.add_h6(**opts, &block)
    end

    def p(**opts, &block)
      builder.add_p(**opts, &block)
    end

    def actor(**opts, &block)
      builder.add_actor(**opts, &block)
    end

    def actor2(**opts, &block)
      builder.add_actor2(**opts, &block)
    end

    def callout(**opts, &block)
      builder.add_callout(**opts, &block)
    end

    def callout2(**opts, &block)
      builder.add_callout2(**opts, &block)
    end

    def callout3(**opts, &block)
      builder.add_callout3(**opts, &block)
    end

    def callout4(**opts, &block)
      builder.add_callout4(**opts, &block)
    end

    def circle(**opts, &block)
      builder.add_circle(**opts, &block)
    end

    def cloud(**opts, &block)
      builder.add_cloud(**opts, &block)
    end

    def container(**opts, &block)
      builder.add_container(**opts, &block)
    end

    def container2(**opts, &block)
      builder.add_container2(**opts, &block)
    end

    def container3(**opts, &block)
      builder.add_container3(**opts, &block)
    end

    def container4(**opts, &block)
      builder.add_container4(**opts, &block)
    end

    def cross(**opts, &block)
      builder.add_cross(**opts, &block)
    end

    def envelop(**opts, &block)
      builder.add_envelop(**opts, &block)
    end

    def diamond(**opts, &block)
      builder.add_diamond(**opts, &block)
    end

    def document(**opts, &block)
      builder.add_document(**opts, &block)
    end

    def ellipse(**opts, &block)
      builder.add_ellipse(**opts, &block)
    end

    def hexagon(**opts, &block)
      builder.add_hexagon(**opts, &block)
    end

    def interface(**opts, &block)
      builder.add_interface(**opts, &block)
    end

    def klass(**opts, &block)
      builder.add_klass(**opts, &block)
    end

    def note(**opts, &block)
      builder.add_note(**opts, &block)
    end

    def process(**opts, &block)
      builder.add_process(**opts, &block)
    end

    def rectangle(**opts, &block)
      builder.add_rectangle(**opts, &block)
    end

    def rectangle2(**opts, &block)
      builder.add_rectangle2(**opts, &block)
    end

    def square(**opts, &block)
      builder.add_square(**opts, &block)
    end

    def step(**opts, &block)
      builder.add_step(**opts, &block)
    end

    def tick(**opts, &block)
      builder.add_tick(**opts, &block)
    end

    def face(**opts, &block)
      builder.add_face(**opts, &block)
    end

    def triangle(**opts, &block)
      builder.add_triangle(**opts, &block)
    end

    def embed_row(**opts, &block)
      builder.add_embed_row(**opts, &block)
    end

    def embed_col50(**opts, &block)
      builder.add_embed_col50(**opts, &block)
    end

    def embed_col200(**opts, &block)
      builder.add_embed_col200(**opts, &block)
    end
  end
  # :nocov:
end
