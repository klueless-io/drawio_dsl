# frozen_string_literal: true

# Attach configuration to the DrawIO DSL module
# :nocov:
module DrawioDsl
  # Used to attach configuration to KConfig module
  module ConfigurationShapes
    ShapeDefaults = Struct.new(:type, :text_only, :x, :y, :w, :h, :style_modifiers, keyword_init: true)
    Shapes = Struct.new(
      :shape,
      :h1,
      :h2,
      :h3,
      :h4,
      :h5,
      :h6,
      :p,
      :actor,
      :actor2,
      :callout,
      :callout2,
      :callout3,
      :callout4,
      :circle,
      :cloud,
      :container,
      :container2,
      :container3,
      :container4,
      :cross,
      :envelop,
      :diamond,
      :document,
      :ellipse,
      :hexagon,
      :interface,
      :klass,
      :note,
      :process,
      :rectangle,
      :rectangle2,
      :square,
      :step,
      :tick,
      :face,
      :triangle,
      :embed_row,
      :embed_col50,
      :embed_col200,
      keyword_init: true
    )

    def add_shapes
      @shapes = Shapes.new(
        shape: ShapeDefaults.new(type: :shape, text_only: false, x: 0, y: 0, w: 20, h: 20, style_modifiers: ''),
        h1: ShapeDefaults.new(type: :h1, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=89;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        h2: ShapeDefaults.new(type: :h2, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=67;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        h3: ShapeDefaults.new(type: :h3, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=50;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        h4: ShapeDefaults.new(type: :h4, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=37;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        h5: ShapeDefaults.new(type: :h5, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=28;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        h6: ShapeDefaults.new(type: :h6, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=21;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        p: ShapeDefaults.new(type: :p, x: 0, text_only: true, y: 0, w: 100, h: 50, style_modifiers: 'text;fontSize=16;fontColor=#ffffff;fontStyle=1;fillColor=none'),
        actor: ShapeDefaults.new(type: :actor, x: 0, text_only: false, y: 0, w: 40, h: 50, style_modifiers: 'shape=actor'),
        actor2: ShapeDefaults.new(type: :actor2, x: 0, text_only: false, y: 0, w: 30, h: 50, style_modifiers: 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'),
        callout: ShapeDefaults.new(type: :callout, x: 0, text_only: false, y: 0, w: 160, h: 120, style_modifiers: 'shape=callout'),
        callout2: ShapeDefaults.new(type: :callout2, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.oval_callout'),
        callout3: ShapeDefaults.new(type: :callout3, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.cloud_callout'),
        callout4: ShapeDefaults.new(type: :callout4, x: 0, text_only: false, y: 0, w: 160, h: 120, style_modifiers: 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'),
        circle: ShapeDefaults.new(type: :circle, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'ellipse'),
        cloud: ShapeDefaults.new(type: :cloud, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'shape=cloud'),
        container: ShapeDefaults.new(type: :container, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'swimlane'),
        container2: ShapeDefaults.new(type: :container2, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;horizontal=0'),
        container3: ShapeDefaults.new(type: :container3, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;startSize=50'),
        container4: ShapeDefaults.new(type: :container4, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'swimlane;resizable=0'),
        cross: ShapeDefaults.new(type: :cross, x: 0, text_only: false, y: 0, w: 50, h: 50, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'),
        envelop: ShapeDefaults.new(type: :envelop, x: 0, text_only: false, y: 0, w: 160, h: 100, style_modifiers: 'shape=message'),
        diamond: ShapeDefaults.new(type: :diamond, x: 0, text_only: false, y: 0, w: 100, h: 100, style_modifiers: 'rhombus'),
        document: ShapeDefaults.new(type: :document, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'shape=mxgraph.basic.document'),
        ellipse: ShapeDefaults.new(type: :ellipse, x: 0, text_only: false, y: 0, w: 200, h: 120, style_modifiers: 'ellipse'),
        hexagon: ShapeDefaults.new(type: :hexagon, x: 0, text_only: false, y: 0, w: 200, h: 120, style_modifiers: 'shape=hexagon'),
        interface: ShapeDefaults.new(type: :interface, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'),
        klass: ShapeDefaults.new(type: :klass, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'),
        note: ShapeDefaults.new(type: :note, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: 'shape=note'),
        process: ShapeDefaults.new(type: :process, x: 0, text_only: false, y: 0, w: 200, h: 120, style_modifiers: 'shape=process'),
        rectangle: ShapeDefaults.new(type: :rectangle, x: 0, text_only: false, y: 0, w: 200, h: 120, style_modifiers: ''),
        rectangle2: ShapeDefaults.new(type: :rectangle2, x: 0, text_only: false, y: 0, w: 200, h: 120, style_modifiers: 'shape=mxgraph.basic.cloud_rect'),
        square: ShapeDefaults.new(type: :square, x: 0, text_only: false, y: 0, w: 160, h: 160, style_modifiers: ''),
        step: ShapeDefaults.new(type: :step, x: 0, text_only: false, y: 0, w: 120, h: 80, style_modifiers: 'shape=step;perimeter=stepPerimeter;fixedSize=1'),
        tick: ShapeDefaults.new(type: :tick, x: 0, text_only: false, y: 0, w: 50, h: 50, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'),
        face: ShapeDefaults.new(type: :face, x: 0, text_only: false, y: 0, w: 100, h: 100, style_modifiers: 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'),
        triangle: ShapeDefaults.new(type: :triangle, x: 0, text_only: false, y: 0, w: 100, h: 100, style_modifiers: 'triangle'),
        embed_row: ShapeDefaults.new(type: :embed_row, x: 0, text_only: false, y: 0, w: 200, h: 40, style_modifiers: 'shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;top=0;left=0;bottom=1;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest'),
        embed_col50: ShapeDefaults.new(type: :embed_col50, x: 0, text_only: false, y: 0, w: 50, h: 40, style_modifiers: 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden'),
        embed_col200: ShapeDefaults.new(type: :embed_col200, x: 0, text_only: false, y: 0, w: 150, h: 40, style_modifiers: 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;align=left;spacingLeft=6;overflow=hidden')
      )
    end
  end
end
# :nocov:
