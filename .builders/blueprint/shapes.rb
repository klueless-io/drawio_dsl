m = KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  table :shapes do
    fields [:type, :text_only, :x, :y, :w, :h, :style_modifiers]

    # shape is a custom object
    # row :shape      , 0, 0,  20,  20, ''

    # configuration for general purpose shapes
    row :h1                   ,  true, 0, 0, 100,  50, 'text;fontSize=89;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h2                   ,  true, 0, 0, 100,  50, 'text;fontSize=67;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h3                   ,  true, 0, 0, 100,  50, 'text;fontSize=50;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h4                   ,  true, 0, 0, 100,  50, 'text;fontSize=37;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h5                   ,  true, 0, 0, 100,  50, 'text;fontSize=28;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h6                   ,  true, 0, 0, 100,  50, 'text;fontSize=21;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :p                    ,  true, 0, 0, 100,  50, 'text;fontSize=16;fontColor=#ffffff;fontStyle=1;fillColor=none'

    row :actor                , false, 0, 0,  40,  50, 'shape=actor'
    row :actor2               , false, 0, 0,  30,  50, 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'
    row :callout              , false, 0, 0, 160, 120, 'shape=callout'
    row :callout2             , false, 0, 0, 160, 160, 'shape=mxgraph.basic.oval_callout'
    row :callout3             , false, 0, 0, 160, 160, 'shape=mxgraph.basic.cloud_callout'
    row :callout4             , false, 0, 0, 160, 120, 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'
    row :circle               , false, 0, 0, 160, 160, 'ellipse'
    row :cloud                , false, 0, 0, 160, 160, 'shape=cloud'
    row :container            , false, 0, 0, 160, 160, 'swimlane'
    row :container2           , false, 0, 0, 160, 160, 'swimlane;horizontal=0'
    row :container3           , false, 0, 0, 160, 160, 'swimlane;startSize=50'
    row :container4           , false, 0, 0, 160, 160, 'swimlane;resizable=0'
    row :cross                , false, 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'
    row :envelop              , false, 0, 0, 160, 100, 'shape=message'
    row :diamond              , false, 0, 0, 100, 100, 'rhombus'
    row :document             , false, 0, 0, 160, 160, 'shape=mxgraph.basic.document'
    row :ellipse              , false, 0, 0, 200, 120, 'ellipse'
    row :hexagon              , false, 0, 0, 200, 120, 'shape=hexagon'
    row :interface            , false, 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :klass                , false, 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :note                 , false, 0, 0, 160, 160, 'shape=note'
    row :process              , false, 0, 0, 200, 120, 'shape=process'
    row :rectangle            , false, 0, 0, 200, 120, ''
    row :rectangle2           , false, 0, 0, 200, 120, 'shape=mxgraph.basic.cloud_rect'
    row :square               , false, 0, 0, 160, 160, ''
    row :step                 , false, 0, 0, 120,  80, 'shape=step;perimeter=stepPerimeter;fixedSize=1'
    row :tick                 , false, 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'
    row :face                 , false, 0, 0, 100, 100, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'
    row :triangle             , false, 0, 0, 100, 100, 'triangle'

    # configuration for embedded element shape
    # note that the width / height probably should be driven of parent shape
    row :embed_row            , false, 0, 0, 200,  40, 'shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;top=0;left=0;bottom=1;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest'
    row :embed_col50          , false, 0, 0,  50,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden'
    row :embed_col200         , false, 0, 0, 150,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;align=left;spacingLeft=6;overflow=hidden'
  end

  action do
    data = self.raw_data
    shapes = JSON.pretty_generate(data['shapes'])

    k_builder
      .cd(:data)
      .add_file('shapes.json', content: shapes, on_exist: :write)
  end
end


