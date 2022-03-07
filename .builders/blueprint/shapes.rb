KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  table :shapes do
    fields [:type, :x, :y, :w, :h, :style_modifiers]

    # shape is a custom object
    # row :shape      , 0, 0,  20,  20, ''

    row :actor        , 0, 0,  40,  50, 'shape=actor'
    row :actor2       , 0, 0,  30,  50, 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'
    row :callout      , 0, 0, 160, 120, 'shape=callout'
    row :callout2     , 0, 0, 160, 160, 'shape=mxgraph.basic.oval_callout'
    row :callout3     , 0, 0, 160, 160, 'shape=mxgraph.basic.cloud_callout'
    row :callout4     , 0, 0, 160, 120, 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'
    row :circle       , 0, 0, 160, 160, 'ellipse'
    row :cloud        , 0, 0, 160, 160, 'shape=cloud'
    row :cross        , 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'
    row :envelop      , 0, 0, 160, 100, 'shape=message'
    row :diamond      , 0, 0, 100, 100, 'rhombus'
    row :document     , 0, 0, 160, 160, 'shape=mxgraph.basic.document'
    row :ellipse      , 0, 0, 200, 120, 'ellipse'
    row :hexagon      , 0, 0, 200, 120, 'shape=hexagon'
    row :container    , 0, 0, 160, 160, 'swimlane;horizontal=0'
    row :container2   , 0, 0, 160, 160, 'swimlane'
    row :container3   , 0, 0, 160, 160, 'swimlane;startSize=50'
    row :container4   , 0, 0, 160, 160, 'swimlane;resizable=0'
    row :note         , 0, 0, 160, 160, 'shape=note'
    row :process      , 0, 0, 200, 120, 'shape=process'
    row :rectangle    , 0, 0, 200, 120, ''
    row :rectangle2   , 0, 0, 200, 120, 'shape=mxgraph.basic.cloud_rect'
    row :square       , 0, 0, 160, 160, ''
    row :step         , 0, 0, 120,  80, 'shape=step;perimeter=stepPerimeter;fixedSize=1'
    row :tick         , 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'
    row :face         , 0, 0, 100, 100, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'
    row :triangle     , 0, 0, 100, 100, 'triangle'

  end

  action do
    data = self.raw_data
    shapes = JSON.pretty_generate(data['shapes'])

    k_builder
      .cd(:data)
      .add_file('shapes.json', content: shapes, on_exist: :write)
  end
end
