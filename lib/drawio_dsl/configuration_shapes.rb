# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
# :nocov:
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    ShapeDefaults = Struct.new(:type, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    Shapes = Struct.new(
      :shape,
      :actor,
      :actor2,
      :callout,
      :callout2,
      :callout3,
      :callout4,
      :circle,
      :cloud,
      :cross,
      :envelop,
      :diamond,
      :document,
      :ellipse,
      :hexagon,
      :container,
      :container2,
      :container3,
      :container4,
      :note,
      :process,
      :rectangle,
      :rectangle2,
      :square,
      :step,
      :tick,
      :face,
      :triangle,
      keyword_init: true
    )

    def add_shapes
      @shapes = Shapes.new(
        shape: ShapeDefaults.new(type: :shape, x: 0, y: 0, w: 20, h: 20, style_modifiers: ''),
        actor: ShapeDefaults.new(type: :actor, x: 0, y: 0, w: 40, h: 50, style_modifiers: 'shape=actor'),
        actor2: ShapeDefaults.new(type: :actor2, x: 0, y: 0, w: 30, h: 50, style_modifiers: 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'),
        callout: ShapeDefaults.new(type: :callout, x: 0, y: 0, w: 160, h: 120, style_modifiers: 'shape=callout'),
        callout2: ShapeDefaults.new(type: :callout2, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.oval_callout'),
        callout3: ShapeDefaults.new(type: :callout3, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.cloud_callout'),
        callout4: ShapeDefaults.new(type: :callout4, x: 0, y: 0, w: 160, h: 120, style_modifiers: 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'),
        circle: ShapeDefaults.new(type: :circle, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'ellipse'),
        cloud: ShapeDefaults.new(type: :cloud, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=cloud'),
        cross: ShapeDefaults.new(type: :cross, x: 0, y: 0, w: 50, h: 50, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'),
        envelop: ShapeDefaults.new(type: :envelop, x: 0, y: 0, w: 160, h: 100, style_modifiers: 'shape=message'),
        diamond: ShapeDefaults.new(type: :diamond, x: 0, y: 0, w: 100, h: 100, style_modifiers: 'rhombus'),
        document: ShapeDefaults.new(type: :document, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.document'),
        ellipse: ShapeDefaults.new(type: :ellipse, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'ellipse'),
        hexagon: ShapeDefaults.new(type: :hexagon, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'shape=hexagon'),
        container: ShapeDefaults.new(type: :container, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;horizontal=0'),
        container2: ShapeDefaults.new(type: :container2, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'swimlane'),
        container3: ShapeDefaults.new(type: :container3, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;startSize=50'),
        container4: ShapeDefaults.new(type: :container4, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;resizable=0'),
        note: ShapeDefaults.new(type: :note, x: 0, y: 0, w: 160, h: 160, style_modifiers: 'shape=note'),
        process: ShapeDefaults.new(type: :process, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'shape=process'),
        rectangle: ShapeDefaults.new(type: :rectangle, x: 0, y: 0, w: 200, h: 120, style_modifiers: ''),
        rectangle2: ShapeDefaults.new(type: :rectangle2, x: 0, y: 0, w: 200, h: 120, style_modifiers: 'shape=mxgraph.basic.cloud_rect'),
        square: ShapeDefaults.new(type: :square, x: 0, y: 0, w: 160, h: 160, style_modifiers: ''),
        step: ShapeDefaults.new(type: :step, x: 0, y: 0, w: 120, h: 80, style_modifiers: 'shape=step;perimeter=stepPerimeter;fixedSize=1'),
        tick: ShapeDefaults.new(type: :tick, x: 0, y: 0, w: 50, h: 50, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'),
        face: ShapeDefaults.new(type: :face, x: 0, y: 0, w: 100, h: 100, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'),
        triangle: ShapeDefaults.new(type: :triangle, x: 0, y: 0, w: 100, h: 100, style_modifiers: 'triangle')
      )
    end
  end
end
# :nocov:
