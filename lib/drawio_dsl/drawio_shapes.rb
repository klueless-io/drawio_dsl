# frozen_string_literal: true

module DrawioDsl
  # List of DSL methods for each common shape
  # :nocov:
  module DrawioShapes
    def random(**opts)
      case rand(57)
      when 0
        solid(**opts)
      when 1
        dash(**opts)
      when 2
        dot(**opts)
      when 3
        dash_dot(**opts)
      when 4
        dash_dot_dot(**opts)
      when 5
        dot_dot_dot(**opts)
      when 6
        long_dash(**opts)
      when 7
        dash_long_dash(**opts)
      when 8
        dash24(**opts)
      when 9
        dash32(**opts)
      when 10
        dash44(**opts)
      when 11
        double(**opts)
      when 12
        double_dash(**opts)
      when 13
        double_dot(**opts)
      when 14
        h1(**opts)
      when 15
        h2(**opts)
      when 16
        h3(**opts)
      when 17
        h4(**opts)
      when 18
        h5(**opts)
      when 19
        h6(**opts)
      when 20
        p(**opts)
      when 21
        actor(**opts)
      when 22
        actor2(**opts)
      when 23
        callout(**opts)
      when 24
        callout2(**opts)
      when 25
        callout3(**opts)
      when 26
        callout4(**opts)
      when 27
        circle(**opts)
      when 28
        cloud(**opts)
      when 29
        container(**opts)
      when 30
        container2(**opts)
      when 31
        container3(**opts)
      when 32
        container4(**opts)
      when 33
        cross(**opts)
      when 34
        envelop(**opts)
      when 35
        database(**opts)
      when 36
        db_json(**opts)
      when 37
        diamond(**opts)
      when 38
        document(**opts)
      when 39
        ellipse(**opts)
      when 40
        group(**opts)
      when 41
        hexagon(**opts)
      when 42
        interface(**opts)
      when 43
        klass(**opts)
      when 44
        note(**opts)
      when 45
        process(**opts)
      when 46
        rectangle(**opts)
      when 47
        rectangle2(**opts)
      when 48
        square(**opts)
      when 49
        step(**opts)
      when 50
        tick(**opts)
      when 51
        todo(**opts)
      when 52
        face(**opts)
      when 53
        triangle(**opts)
      when 54
        embed_row(**opts)
      when 55
        embed_col50(**opts)
      when 56
        embed_col200(**opts)
      end
    end

    def solid(id = nil, **opts, &block)
      builder.add_solid(id, **opts, &block)
    end

    def dash(id = nil, **opts, &block)
      builder.add_dash(id, **opts, &block)
    end

    def dot(id = nil, **opts, &block)
      builder.add_dot(id, **opts, &block)
    end

    def dash_dot(id = nil, **opts, &block)
      builder.add_dash_dot(id, **opts, &block)
    end

    def dash_dot_dot(id = nil, **opts, &block)
      builder.add_dash_dot_dot(id, **opts, &block)
    end

    def dot_dot_dot(id = nil, **opts, &block)
      builder.add_dot_dot_dot(id, **opts, &block)
    end

    def long_dash(id = nil, **opts, &block)
      builder.add_long_dash(id, **opts, &block)
    end

    def dash_long_dash(id = nil, **opts, &block)
      builder.add_dash_long_dash(id, **opts, &block)
    end

    def dash24(id = nil, **opts, &block)
      builder.add_dash24(id, **opts, &block)
    end

    def dash32(id = nil, **opts, &block)
      builder.add_dash32(id, **opts, &block)
    end

    def dash44(id = nil, **opts, &block)
      builder.add_dash44(id, **opts, &block)
    end

    def double(id = nil, **opts, &block)
      builder.add_double(id, **opts, &block)
    end

    def double_dash(id = nil, **opts, &block)
      builder.add_double_dash(id, **opts, &block)
    end

    def double_dot(id = nil, **opts, &block)
      builder.add_double_dot(id, **opts, &block)
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
