# frozen_string_literal: true

# :nocov:
module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
    def add_solid(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      solid = DrawioDsl::Schema::Solid.new(current_page, **opts, &block)
      add_shape(solid)
    end

    def add_h1(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h1 = DrawioDsl::Schema::H1.new(current_page, **opts, &block)
      add_shape(h1)
    end

    def add_h2(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h2 = DrawioDsl::Schema::H2.new(current_page, **opts, &block)
      add_shape(h2)
    end

    def add_h3(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h3 = DrawioDsl::Schema::H3.new(current_page, **opts, &block)
      add_shape(h3)
    end

    def add_h4(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h4 = DrawioDsl::Schema::H4.new(current_page, **opts, &block)
      add_shape(h4)
    end

    def add_h5(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h5 = DrawioDsl::Schema::H5.new(current_page, **opts, &block)
      add_shape(h5)
    end

    def add_h6(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      h6 = DrawioDsl::Schema::H6.new(current_page, **opts, &block)
      add_shape(h6)
    end

    def add_p(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      p = DrawioDsl::Schema::P.new(current_page, **opts, &block)
      add_shape(p)
    end

    def add_actor(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      actor = DrawioDsl::Schema::Actor.new(current_page, **opts, &block)
      add_shape(actor)
    end

    def add_actor2(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      actor2 = DrawioDsl::Schema::Actor2.new(current_page, **opts, &block)
      add_shape(actor2)
    end

    def add_callout(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      callout = DrawioDsl::Schema::Callout.new(current_page, **opts, &block)
      add_shape(callout)
    end

    def add_callout2(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      callout2 = DrawioDsl::Schema::Callout2.new(current_page, **opts, &block)
      add_shape(callout2)
    end

    def add_callout3(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      callout3 = DrawioDsl::Schema::Callout3.new(current_page, **opts, &block)
      add_shape(callout3)
    end

    def add_callout4(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      callout4 = DrawioDsl::Schema::Callout4.new(current_page, **opts, &block)
      add_shape(callout4)
    end

    def add_circle(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      circle = DrawioDsl::Schema::Circle.new(current_page, **opts, &block)
      add_shape(circle)
    end

    def add_cloud(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      cloud = DrawioDsl::Schema::Cloud.new(current_page, **opts, &block)
      add_shape(cloud)
    end

    def add_container(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      container = DrawioDsl::Schema::Container.new(current_page, **opts, &block)
      add_shape(container)
    end

    def add_container2(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      container2 = DrawioDsl::Schema::Container2.new(current_page, **opts, &block)
      add_shape(container2)
    end

    def add_container3(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      container3 = DrawioDsl::Schema::Container3.new(current_page, **opts, &block)
      add_shape(container3)
    end

    def add_container4(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      container4 = DrawioDsl::Schema::Container4.new(current_page, **opts, &block)
      add_shape(container4)
    end

    def add_cross(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      cross = DrawioDsl::Schema::Cross.new(current_page, **opts, &block)
      add_shape(cross)
    end

    def add_envelop(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      envelop = DrawioDsl::Schema::Envelop.new(current_page, **opts, &block)
      add_shape(envelop)
    end

    def add_database(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      database = DrawioDsl::Schema::Database.new(current_page, **opts, &block)
      add_shape(database)
    end

    def add_db_json(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      db_json = DrawioDsl::Schema::DbJson.new(current_page, **opts, &block)
      add_shape(db_json)
    end

    def add_diamond(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      diamond = DrawioDsl::Schema::Diamond.new(current_page, **opts, &block)
      add_shape(diamond)
    end

    def add_document(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      document = DrawioDsl::Schema::Document.new(current_page, **opts, &block)
      add_shape(document)
    end

    def add_ellipse(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      ellipse = DrawioDsl::Schema::Ellipse.new(current_page, **opts, &block)
      add_shape(ellipse)
    end

    def add_group(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      group = DrawioDsl::Schema::Group.new(current_page, **opts, &block)
      add_shape(group)
    end

    def add_hexagon(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      hexagon = DrawioDsl::Schema::Hexagon.new(current_page, **opts, &block)
      add_shape(hexagon)
    end

    def add_interface(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      interface = DrawioDsl::Schema::Interface.new(current_page, **opts, &block)
      add_shape(interface)
    end

    def add_klass(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      klass = DrawioDsl::Schema::Klass.new(current_page, **opts, &block)
      add_shape(klass)
    end

    def add_note(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      note = DrawioDsl::Schema::Note.new(current_page, **opts, &block)
      add_shape(note)
    end

    def add_process(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      process = DrawioDsl::Schema::Process.new(current_page, **opts, &block)
      add_shape(process)
    end

    def add_rectangle(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      rectangle = DrawioDsl::Schema::Rectangle.new(current_page, **opts, &block)
      add_shape(rectangle)
    end

    def add_rectangle2(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      rectangle2 = DrawioDsl::Schema::Rectangle2.new(current_page, **opts, &block)
      add_shape(rectangle2)
    end

    def add_square(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      square = DrawioDsl::Schema::Square.new(current_page, **opts, &block)
      add_shape(square)
    end

    def add_step(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      step = DrawioDsl::Schema::Step.new(current_page, **opts, &block)
      add_shape(step)
    end

    def add_tick(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      tick = DrawioDsl::Schema::Tick.new(current_page, **opts, &block)
      add_shape(tick)
    end

    def add_todo(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      todo = DrawioDsl::Schema::Todo.new(current_page, **opts, &block)
      add_shape(todo)
    end

    def add_face(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      face = DrawioDsl::Schema::Face.new(current_page, **opts, &block)
      add_shape(face)
    end

    def add_triangle(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      triangle = DrawioDsl::Schema::Triangle.new(current_page, **opts, &block)
      add_shape(triangle)
    end

    def add_embed_row(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      embed_row = DrawioDsl::Schema::EmbedRow.new(current_page, **opts, &block)
      add_shape(embed_row)
    end

    def add_embed_col50(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      embed_col50 = DrawioDsl::Schema::EmbedCol50.new(current_page, **opts, &block)
      add_shape(embed_col50)
    end

    def add_embed_col200(id = nil, **opts, &block)
      opts = { id: id }.merge(opts) if id
      embed_col200 = DrawioDsl::Schema::EmbedCol200.new(current_page, **opts, &block)
      add_shape(embed_col200)
    end
  end
end
# :nocov:
