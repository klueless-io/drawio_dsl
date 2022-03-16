# frozen_string_literal: true

module DrawioDsl
  # DrawioDsl::Shapes is a list of DSL methods (one per shape)
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(40)
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
        todo(**opts)
      when 35
        face(**opts)
      when 36
        triangle(**opts)
      when 37
        embed_row(**opts)
      when 38
        embed_col50(**opts)
      when 39
        embed_col200(**opts)
      end
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
