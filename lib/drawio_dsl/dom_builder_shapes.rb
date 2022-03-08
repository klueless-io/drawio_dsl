# frozen_string_literal: true

# :nocov:
module DrawioDsl
  # DrawioDsl is a DSL for draw-io diagrams.
  module DomBuilderShapes
    def add_h1(**opts)
      h1 = DrawioDsl::Schema::H1.new(current_page, **opts)
      add_shape(h1)
    end

    def add_h2(**opts)
      h2 = DrawioDsl::Schema::H2.new(current_page, **opts)
      add_shape(h2)
    end

    def add_h3(**opts)
      h3 = DrawioDsl::Schema::H3.new(current_page, **opts)
      add_shape(h3)
    end

    def add_h4(**opts)
      h4 = DrawioDsl::Schema::H4.new(current_page, **opts)
      add_shape(h4)
    end

    def add_h5(**opts)
      h5 = DrawioDsl::Schema::H5.new(current_page, **opts)
      add_shape(h5)
    end

    def add_h6(**opts)
      h6 = DrawioDsl::Schema::H6.new(current_page, **opts)
      add_shape(h6)
    end

    def add_p(**opts)
      p = DrawioDsl::Schema::P.new(current_page, **opts)
      add_shape(p)
    end

    def add_actor(**opts)
      actor = DrawioDsl::Schema::Actor.new(current_page, **opts)
      add_shape(actor)
    end

    def add_actor2(**opts)
      actor2 = DrawioDsl::Schema::Actor2.new(current_page, **opts)
      add_shape(actor2)
    end

    def add_callout(**opts)
      callout = DrawioDsl::Schema::Callout.new(current_page, **opts)
      add_shape(callout)
    end

    def add_callout2(**opts)
      callout2 = DrawioDsl::Schema::Callout2.new(current_page, **opts)
      add_shape(callout2)
    end

    def add_callout3(**opts)
      callout3 = DrawioDsl::Schema::Callout3.new(current_page, **opts)
      add_shape(callout3)
    end

    def add_callout4(**opts)
      callout4 = DrawioDsl::Schema::Callout4.new(current_page, **opts)
      add_shape(callout4)
    end

    def add_circle(**opts)
      circle = DrawioDsl::Schema::Circle.new(current_page, **opts)
      add_shape(circle)
    end

    def add_cloud(**opts)
      cloud = DrawioDsl::Schema::Cloud.new(current_page, **opts)
      add_shape(cloud)
    end

    def add_cross(**opts)
      cross = DrawioDsl::Schema::Cross.new(current_page, **opts)
      add_shape(cross)
    end

    def add_envelop(**opts)
      envelop = DrawioDsl::Schema::Envelop.new(current_page, **opts)
      add_shape(envelop)
    end

    def add_diamond(**opts)
      diamond = DrawioDsl::Schema::Diamond.new(current_page, **opts)
      add_shape(diamond)
    end

    def add_document(**opts)
      document = DrawioDsl::Schema::Document.new(current_page, **opts)
      add_shape(document)
    end

    def add_ellipse(**opts)
      ellipse = DrawioDsl::Schema::Ellipse.new(current_page, **opts)
      add_shape(ellipse)
    end

    def add_hexagon(**opts)
      hexagon = DrawioDsl::Schema::Hexagon.new(current_page, **opts)
      add_shape(hexagon)
    end

    def add_container(**opts)
      container = DrawioDsl::Schema::Container.new(current_page, **opts)
      add_shape(container)
    end

    def add_container2(**opts)
      container2 = DrawioDsl::Schema::Container2.new(current_page, **opts)
      add_shape(container2)
    end

    def add_container3(**opts)
      container3 = DrawioDsl::Schema::Container3.new(current_page, **opts)
      add_shape(container3)
    end

    def add_container4(**opts)
      container4 = DrawioDsl::Schema::Container4.new(current_page, **opts)
      add_shape(container4)
    end

    def add_note(**opts)
      note = DrawioDsl::Schema::Note.new(current_page, **opts)
      add_shape(note)
    end

    def add_process(**opts)
      process = DrawioDsl::Schema::Process.new(current_page, **opts)
      add_shape(process)
    end

    def add_rectangle(**opts)
      rectangle = DrawioDsl::Schema::Rectangle.new(current_page, **opts)
      add_shape(rectangle)
    end

    def add_rectangle2(**opts)
      rectangle2 = DrawioDsl::Schema::Rectangle2.new(current_page, **opts)
      add_shape(rectangle2)
    end

    def add_square(**opts)
      square = DrawioDsl::Schema::Square.new(current_page, **opts)
      add_shape(square)
    end

    def add_step(**opts)
      step = DrawioDsl::Schema::Step.new(current_page, **opts)
      add_shape(step)
    end

    def add_tick(**opts)
      tick = DrawioDsl::Schema::Tick.new(current_page, **opts)
      add_shape(tick)
    end

    def add_face(**opts)
      face = DrawioDsl::Schema::Face.new(current_page, **opts)
      add_shape(face)
    end

    def add_triangle(**opts)
      triangle = DrawioDsl::Schema::Triangle.new(current_page, **opts)
      add_shape(triangle)
    end

    def add_embed_row(**opts)
      embed_row = DrawioDsl::Schema::EmbedRow.new(current_page, **opts)
      add_shape(embed_row)
    end

    def add_embed_col50(**opts)
      embed_col50 = DrawioDsl::Schema::EmbedCol50.new(current_page, **opts)
      add_shape(embed_col50)
    end

    def add_embed_col200(**opts)
      embed_col200 = DrawioDsl::Schema::EmbedCol200.new(current_page, **opts)
      add_shape(embed_col200)
    end
  end
end
# :nocov:
