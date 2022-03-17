# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(42)
      when 0
        line(**opts)
      when 1
        h1(**opts)
      when 2
        h2(**opts)
      when 3
        h3(**opts)
      when 4
        h4(**opts)
      when 5
        h5(**opts)
      when 6
        h6(**opts)
      when 7
        p(**opts)
      when 8
        actor(**opts)
      when 9
        actor2(**opts)
      when 10
        callout(**opts)
      when 11
        callout2(**opts)
      when 12
        callout3(**opts)
      when 13
        callout4(**opts)
      when 14
        circle(**opts)
      when 15
        cloud(**opts)
      when 16
        container(**opts)
      when 17
        container2(**opts)
      when 18
        container3(**opts)
      when 19
        container4(**opts)
      when 20
        cross(**opts)
      when 21
        envelop(**opts)
      when 22
        database(**opts)
      when 23
        diamond(**opts)
      when 24
        document(**opts)
      when 25
        ellipse(**opts)
      when 26
        hexagon(**opts)
      when 27
        interface(**opts)
      when 28
        klass(**opts)
      when 29
        note(**opts)
      when 30
        process(**opts)
      when 31
        rectangle(**opts)
      when 32
        rectangle2(**opts)
      when 33
        square(**opts)
      when 34
        step(**opts)
      when 35
        tick(**opts)
      when 36
        todo(**opts)
      when 37
        face(**opts)
      when 38
        triangle(**opts)
      when 39
        embed_row(**opts)
      when 40
        embed_col50(**opts)
      when 41
        embed_col200(**opts)
      end
    end

    def line(id = nil, **opts, &block)
      builder.add_line(id, **opts, &block)
    end

    def h1(id = nil, **opts, &block)
      builder.add_h1(id, **opts, &block)
    end

    def h2(id = nil, **opts, &block)
      builder.add_h2(id, **opts, &block)
    end

    def h3(id = nil, **opts, &block)
      builder.add_h3(id, **opts, &block)
    end

    def h4(id = nil, **opts, &block)
      builder.add_h4(id, **opts, &block)
    end

    def h5(id = nil, **opts, &block)
      builder.add_h5(id, **opts, &block)
    end

    def h6(id = nil, **opts, &block)
      builder.add_h6(id, **opts, &block)
    end

    def p(id = nil, **opts, &block)
      builder.add_p(id, **opts, &block)
    end

    def actor(id = nil, **opts, &block)
      builder.add_actor(id, **opts, &block)
    end

    def actor2(id = nil, **opts, &block)
      builder.add_actor2(id, **opts, &block)
    end

    def callout(id = nil, **opts, &block)
      builder.add_callout(id, **opts, &block)
    end

    def callout2(id = nil, **opts, &block)
      builder.add_callout2(id, **opts, &block)
    end

    def callout3(id = nil, **opts, &block)
      builder.add_callout3(id, **opts, &block)
    end

    def callout4(id = nil, **opts, &block)
      builder.add_callout4(id, **opts, &block)
    end

    def circle(id = nil, **opts, &block)
      builder.add_circle(id, **opts, &block)
    end

    def cloud(id = nil, **opts, &block)
      builder.add_cloud(id, **opts, &block)
    end

    def container(id = nil, **opts, &block)
      builder.add_container(id, **opts, &block)
    end

    def container2(id = nil, **opts, &block)
      builder.add_container2(id, **opts, &block)
    end

    def container3(id = nil, **opts, &block)
      builder.add_container3(id, **opts, &block)
    end

    def container4(id = nil, **opts, &block)
      builder.add_container4(id, **opts, &block)
    end

    def cross(id = nil, **opts, &block)
      builder.add_cross(id, **opts, &block)
    end

    def envelop(id = nil, **opts, &block)
      builder.add_envelop(id, **opts, &block)
    end

    def database(id = nil, **opts, &block)
      builder.add_database(id, **opts, &block)
    end

    def diamond(id = nil, **opts, &block)
      builder.add_diamond(id, **opts, &block)
    end

    def document(id = nil, **opts, &block)
      builder.add_document(id, **opts, &block)
    end

    def ellipse(id = nil, **opts, &block)
      builder.add_ellipse(id, **opts, &block)
    end

    def hexagon(id = nil, **opts, &block)
      builder.add_hexagon(id, **opts, &block)
    end

    def interface(id = nil, **opts, &block)
      builder.add_interface(id, **opts, &block)
    end

    def klass(id = nil, **opts, &block)
      builder.add_klass(id, **opts, &block)
    end

    def note(id = nil, **opts, &block)
      builder.add_note(id, **opts, &block)
    end

    def process(id = nil, **opts, &block)
      builder.add_process(id, **opts, &block)
    end

    def rectangle(id = nil, **opts, &block)
      builder.add_rectangle(id, **opts, &block)
    end

    def rectangle2(id = nil, **opts, &block)
      builder.add_rectangle2(id, **opts, &block)
    end

    def square(id = nil, **opts, &block)
      builder.add_square(id, **opts, &block)
    end

    def step(id = nil, **opts, &block)
      builder.add_step(id, **opts, &block)
    end

    def tick(id = nil, **opts, &block)
      builder.add_tick(id, **opts, &block)
    end

    def todo(id = nil, **opts, &block)
      builder.add_todo(id, **opts, &block)
    end

    def face(id = nil, **opts, &block)
      builder.add_face(id, **opts, &block)
    end

    def triangle(id = nil, **opts, &block)
      builder.add_triangle(id, **opts, &block)
    end

    def embed_row(id = nil, **opts, &block)
      builder.add_embed_row(id, **opts, &block)
    end

    def embed_col50(id = nil, **opts, &block)
      builder.add_embed_col50(id, **opts, &block)
    end

    def embed_col200(id = nil, **opts, &block)
      builder.add_embed_col200(id, **opts, &block)
    end
  end
  # :nocov:
end
