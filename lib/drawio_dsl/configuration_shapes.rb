# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    ShapeDefaults = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    Shapes = Struct.new(
      :shape,
      :callout,
      :circle,
      :cloud,
      :diamond,
      :ellipse,
      :hexagon,
      :hcontainer,
      :note,
      :process,
      :rectangle,
      :square,
      :vcontainer,
      keyword_init: true
    )

    def add_shapes
      @shapes = Shapes.new(
        shape: ShapeDefaults.new(type: :shape, x: 0, y: 0, w: 20, h: 20, style_modifiers: ''),
        callout: ShapeDefaults.new(type: :callout, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=callout'),
        circle: ShapeDefaults.new(type: :circle, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'ellipse'),
        cloud: ShapeDefaults.new(type: :cloud, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=cloud'),
        diamond: ShapeDefaults.new(type: :diamond, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'rhombus'),
        ellipse: ShapeDefaults.new(type: :ellipse, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'ellipse'),
        hexagon: ShapeDefaults.new(type: :hexagon, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'shape=hexagon'),
        hcontainer: ShapeDefaults.new(type: :hcontainer, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'swimlane;horizontal=0'),
        note: ShapeDefaults.new(type: :note, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=note'),
        process: ShapeDefaults.new(type: :process, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'shape=process'),
        rectangle: ShapeDefaults.new(type: :rectangle, x: 0, y: 0, w: 200, h: 120, style_modifiers: ''),
        square: ShapeDefaults.new(type: :square, x: 0, y: 0, w: 160, h: 160, style_modifiers: ''),
        vcontainer: ShapeDefaults.new(type: :vcontainer, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'swimlane')
      )
    end
  end
end
