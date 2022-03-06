# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    def add_shapes
      @shapes = Shapes.new(
        callout: ShapeDefaults.new(type: :callout, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=callout'),
        circle: ShapeDefaults.new(type: :circle, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;ellipse'),
        cloud: ShapeDefaults.new(type: :cloud, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=cloud'),
        diamond: ShapeDefaults.new(type: :diamond, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;rhombus'),
        ellipse: ShapeDefaults.new(type: :ellipse, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;ellipse'),
        hexagon: ShapeDefaults.new(type: :hexagon, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=hexagon'),
        note: ShapeDefaults.new(type: :note, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=note'),
        process: ShapeDefaults.new(type: :process, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=process'),
        rectangle: ShapeDefaults.new(type: :rectangle, x: 0, y: 0, w: 200, h: 120, style_modifiers: ''),
        square: ShapeDefaults.new(type: :square, x: 0, y: 0, w: 160, h: 160, style_modifiers: '')
      )
    end
  end
end
