# frozen_string_literal: true

# :nocov:
module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
    def add_h1(**opts, &block)
      h1 = DrawioDsl::Schema::H1.new(current_page, **opts, &block)
      add_shape(h1)
    end

    def add_h2(**opts, &block)
      h2 = DrawioDsl::Schema::H2.new(current_page, **opts, &block)
      add_shape(h2)
    end

    def add_h3(**opts, &block)
      h3 = DrawioDsl::Schema::H3.new(current_page, **opts, &block)
      add_shape(h3)
    end

    def add_h4(**opts, &block)
      h4 = DrawioDsl::Schema::H4.new(current_page, **opts, &block)
      add_shape(h4)
    end

    def add_h5(**opts, &block)
      h5 = DrawioDsl::Schema::H5.new(current_page, **opts, &block)
      add_shape(h5)
    end

    def add_h6(**opts, &block)
      h6 = DrawioDsl::Schema::H6.new(current_page, **opts, &block)
      add_shape(h6)
    end

    def add_p(**opts, &block)
      p = DrawioDsl::Schema::P.new(current_page, **opts, &block)
      add_shape(p)
    end

    def add_actor(**opts, &block)
      actor = DrawioDsl::Schema::Actor.new(current_page, **opts, &block)
      add_shape(actor)
    end

    def add_actor2(**opts, &block)
      actor2 = DrawioDsl::Schema::Actor2.new(current_page, **opts, &block)
      add_shape(actor2)
    end

    def add_callout(**opts, &block)
      callout = DrawioDsl::Schema::Callout.new(current_page, **opts, &block)
      add_shape(callout)
    end

    def add_callout2(**opts, &block)
      callout2 = DrawioDsl::Schema::Callout2.new(current_page, **opts, &block)
      add_shape(callout2)
    end

    def add_callout3(**opts, &block)
      callout3 = DrawioDsl::Schema::Callout3.new(current_page, **opts, &block)
      add_shape(callout3)
    end

    def add_callout4(**opts, &block)
      callout4 = DrawioDsl::Schema::Callout4.new(current_page, **opts, &block)
      add_shape(callout4)
    end

    def add_circle(**opts, &block)
      circle = DrawioDsl::Schema::Circle.new(current_page, **opts, &block)
      add_shape(circle)
    end

    def add_cloud(**opts, &block)
      cloud = DrawioDsl::Schema::Cloud.new(current_page, **opts, &block)
      add_shape(cloud)
    end

    def add_container(**opts, &block)
      container = DrawioDsl::Schema::Container.new(current_page, **opts, &block)
      add_shape(container)
    end

    def add_container2(**opts, &block)
      container2 = DrawioDsl::Schema::Container2.new(current_page, **opts, &block)
      add_shape(container2)
    end

    def add_container3(**opts, &block)
      container3 = DrawioDsl::Schema::Container3.new(current_page, **opts, &block)
      add_shape(container3)
    end

    def add_container4(**opts, &block)
      container4 = DrawioDsl::Schema::Container4.new(current_page, **opts, &block)
      add_shape(container4)
    end

    def add_cross(**opts, &block)
      cross = DrawioDsl::Schema::Cross.new(current_page, **opts, &block)
      add_shape(cross)
    end

    def add_envelop(**opts, &block)
      envelop = DrawioDsl::Schema::Envelop.new(current_page, **opts, &block)
      add_shape(envelop)
    end

    def add_diamond(**opts, &block)
      diamond = DrawioDsl::Schema::Diamond.new(current_page, **opts, &block)
      add_shape(diamond)
    end

    def add_document(**opts, &block)
      document = DrawioDsl::Schema::Document.new(current_page, **opts, &block)
      add_shape(document)
    end

    def add_ellipse(**opts, &block)
      ellipse = DrawioDsl::Schema::Ellipse.new(current_page, **opts, &block)
      add_shape(ellipse)
    end

    def add_hexagon(**opts, &block)
      hexagon = DrawioDsl::Schema::Hexagon.new(current_page, **opts, &block)
      add_shape(hexagon)
    end

    def add_interface(**opts, &block)
      interface = DrawioDsl::Schema::Interface.new(current_page, **opts, &block)
      add_shape(interface)
    end

    def add_klass(**opts, &block)
      klass = DrawioDsl::Schema::Klass.new(current_page, **opts, &block)
      add_shape(klass)
    end

    def add_note(**opts, &block)
      note = DrawioDsl::Schema::Note.new(current_page, **opts, &block)
      add_shape(note)
    end

    def add_process(**opts, &block)
      process = DrawioDsl::Schema::Process.new(current_page, **opts, &block)
      add_shape(process)
    end

    def add_rectangle(**opts, &block)
      rectangle = DrawioDsl::Schema::Rectangle.new(current_page, **opts, &block)
      add_shape(rectangle)
    end

    def add_rectangle2(**opts, &block)
      rectangle2 = DrawioDsl::Schema::Rectangle2.new(current_page, **opts, &block)
      add_shape(rectangle2)
    end

    def add_square(**opts, &block)
      square = DrawioDsl::Schema::Square.new(current_page, **opts, &block)
      add_shape(square)
    end

    def add_step(**opts, &block)
      step = DrawioDsl::Schema::Step.new(current_page, **opts, &block)
      add_shape(step)
    end

    def add_tick(**opts, &block)
      tick = DrawioDsl::Schema::Tick.new(current_page, **opts, &block)
      add_shape(tick)
    end

    def add_todo(**opts, &block)
      todo = DrawioDsl::Schema::Todo.new(current_page, **opts, &block)
      add_shape(todo)
    end

    def add_face(**opts, &block)
      face = DrawioDsl::Schema::Face.new(current_page, **opts, &block)
      add_shape(face)
    end

    def add_triangle(**opts, &block)
      triangle = DrawioDsl::Schema::Triangle.new(current_page, **opts, &block)
      add_shape(triangle)
    end

    def add_embed_row(**opts, &block)
      embed_row = DrawioDsl::Schema::EmbedRow.new(current_page, **opts, &block)
      add_shape(embed_row)
    end

    def add_embed_col50(**opts, &block)
      embed_col50 = DrawioDsl::Schema::EmbedCol50.new(current_page, **opts, &block)
      add_shape(embed_col50)
    end

    def add_embed_col200(**opts, &block)
      embed_col200 = DrawioDsl::Schema::EmbedCol200.new(current_page, **opts, &block)
      add_shape(embed_col200)
    end
  end
end
# :nocov:
