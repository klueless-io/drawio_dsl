# frozen_string_literal: true

module DrawioDsl
  # List of DSL methods for each common shape
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(44)
      when 0
        solid(**opts)
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
        db_json(**opts)
      when 24
        diamond(**opts)
      when 25
        document(**opts)
      when 26
        ellipse(**opts)
      when 27
        group(**opts)
      when 28
        hexagon(**opts)
      when 29
        interface(**opts)
      when 30
        klass(**opts)
      when 31
        note(**opts)
      when 32
        process(**opts)
      when 33
        rectangle(**opts)
      when 34
        rectangle2(**opts)
      when 35
        square(**opts)
      when 36
        step(**opts)
      when 37
        tick(**opts)
      when 38
        todo(**opts)
      when 39
        face(**opts)
      when 40
        triangle(**opts)
      when 41
        embed_row(**opts)
      when 42
        embed_col50(**opts)
      when 43
        embed_col200(**opts)
      end
    end

    def solid(id = nil, **opts, &block)
      builder.add_solid(id, **opts, &block)
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

    def db_json(id = nil, **opts, &block)
      builder.add_db_json(id, **opts, &block)
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

    def group(id = nil, **opts, &block)
      builder.add_group(id, **opts, &block)
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
