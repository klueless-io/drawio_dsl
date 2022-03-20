m = KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  # other settings
  # strokeWidth: 1-n
  # when there is an arrow at beginning
  # startFill=1,0
  # when there is an arrow at end
  # endFill=1,0


  table :strokes do
    fields [:name, :style]

    row :dashed               , 'dashed=1;fixDash=1'
    row :dotted               , 'dashed=1;fixDash=1;dashPattern=1 4'
    row :dashdot              , 'dashed=1;fixDash=1;dashPattern=10 5 1 5'
    row :dashdotdot           , 'dashed=1;fixDash=1;dashPattern=10 5 1 5 1 5'
    row :dotdotdot            , 'dashed=1;fixDash=1;dashPattern=1 2'
    row :longdash             , 'dashed=1;fixDash=1;dashPattern=16 6'
    row :dashlongdash         , 'dashed=1;fixDash=1;dashPattern=10 6 16 6'
    row :dashed24             , 'dashed=1;fixDash=1;dashPattern=3 8'
    row :dashed32             , 'dashed=1;fixDash=1;dashPattern=6 5'
    row :dashed44             , 'dashed=1;fixDash=1;dashPattern=8 8'
  end

  table :connector_compass do
    fields %i[name x y]

    row :n  , x: 0.5 , y: 0       # 'exitX=0.5;exitY=0;exitDx=0;exitDy=0'  'entryX=0.5;entryY=0;entryDx=0;entryDy=0'
    row :ne , x: 1   , y: 0       # 'exitX=1;exitY=0;exitDx=0;exitDy=0'    'entryX=1;entryY=0;entryDx=0;entryDy=0'
    row :e  , x: 1   , y: 0.5     # 'exitX=1;exitY=0.5;exitDx=0;exitDy=0'  'entryX=1;entryY=0.5;entryDx=0;entryDy=0'
    row :se , x: 1   , y: 1       # 'exitX=1;exitY=1;exitDx=0;exitDy=0'    'entryX=1;entryY=1;entryDx=0;entryDy=0'
    row :s  , x: 0.5 , y: 1       # 'exitX=0.5;exitY=1;exitDx=0;exitDy=0'  'entryX=0.5;entryY=1;entryDx=0;entryDy=0'
    row :sw , x: 0   , y: 1       # 'exitX=0;exitY=1;exitDx=0;exitDy=0'    'entryX=0;entryY=1;entryDx=0;entryDy=0'
    row :w  , x: 0   , y: 0.5     # 'exitX=0;exitY=0.5;exitDx=0;exitDy=0'  'entryX=0;entryY=0.5;entryDx=0;entryDy=0'
    row :nw , x: 0   , y: 0       # 'exitX=0;exitY=0;exitDx=0;exitDy=0'    'entryX=0;entryY=0;entryDx=0;entryDy=0'
  end

  table :connector_design do
    fields [:name, :style]

    row :style1, ''
    row :style2, 'shape=link'
    row :style3, 'shape=flexArrow'
    row :style4, 'shape=arrow'
  end

  table :connector_arrows do
    fields [:name, :style]

    row :simple                     , 'open'
    row :triangle                   , 'block'
    row :diamond                    , 'diamond'
    row :circle                     , 'oval'
    row :cross                      , 'cross'
    row :short                      , 'classicThin'
    row :default                    , 'classic'
    row :none                       , 'none'
    row :plain                      , 'open'
    row :skewed_dash                , 'dash'
    row :concave                    , 'openThin'
    row :er_many                    , 'ERmany'
    row :er_one                     , 'ERone'
    row :er_one_optional            , 'ERzeroToOne'
    row :er_one_mandatory           , 'ERmandOne'
    row :er_many_optional           , 'ERzeroToMany'
    row :er_many_mandatory          , 'ERoneToMany'
  end

  table :connector_waypoints do # aka edgeStyle
    fields [:name, :style]

    row :straight                 , 'edgeStyle=none'
    row :orthogonal               , 'edgeStyle=orthogonalEdgeStyle'
    row :elbow                    , 'edgeStyle=elbowEdgeStyle'
    row :elbow_vertical           , 'edgeStyle=elbowEdgeStyle;elbow=vertical'
    row :isometric                , 'edgeStyle=isometricEdgeStyle'
    row :isometric_vertical       , 'edgeStyle=isometricEdgeStyle;elbow=vertical'
    row :orthogonal_curved        , 'edgeStyle=orthogonalEdgeStyle;curved=1'
    row :entity_relation          , 'edgeStyle=entityRelationEdgeStyle'
  end

  table :shapes do
    fields [:type, :category, :x, :y, :w, :h, :style_modifiers]

    # shape is a custom object
    # row :shape      , 0, 0,  20,  20, ''

    row :line                 , :line   , 0, 0,  50,  50, 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
    # row :line                 , :line   , 0, 0,  50,  50, 'edgeStyle=entityRelationEdgeStyle;strokeWidth=1;elbow=vertical;startArrow=none;startFill=0;endArrow=block;endFill=0;targetPerimeterSpacing=0;shape=flexArrow;endSize=6;fillStyle=zigzag;'
    # row :dashed               , 'dashed=1;fixDash=1'
    # row :dotted               , 'dashed=1;fixDash=1;dashPattern=1 4'
    # row :dashdot              , 'dashed=1;fixDash=1;dashPattern=10 5 1 5'
    # row :dashdotdot           , 'dashed=1;fixDash=1;dashPattern=10 5 1 5 1 5'
    # row :dotdotdot            , 'dashed=1;fixDash=1;dashPattern=1 2'
    # row :longdash             , 'dashed=1;fixDash=1;dashPattern=16 6'
    # row :dashlongdash         , 'dashed=1;fixDash=1;dashPattern=10 6 16 6'
    # row :dashed24             , 'dashed=1;fixDash=1;dashPattern=3 8'
    # row :dashed32             , 'dashed=1;fixDash=1;dashPattern=6 5'
    # row :dashed44             , 'dashed=1;fixDash=1;dashPattern=8 8'
    # edge="1" parent="node_root_2T8" source="b" target="c"

    # configuration for general purpose shapes
    row :h1                   , :text   , 0, 0, 100,  50, 'text;fontSize=89;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h2                   , :text   , 0, 0, 100,  50, 'text;fontSize=67;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h3                   , :text   , 0, 0, 100,  50, 'text;fontSize=50;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h4                   , :text   , 0, 0, 100,  50, 'text;fontSize=37;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h5                   , :text   , 0, 0, 100,  50, 'text;fontSize=28;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :h6                   , :text   , 0, 0, 100,  50, 'text;fontSize=21;fontColor=#ffffff;fontStyle=1;fillColor=none'
    row :p                    , :text   , 0, 0, 100,  50, 'text;fontSize=16;fontColor=#ffffff;fontStyle=1;fillColor=none'

    row :actor                , :element, 0, 0,  40,  50, 'shape=actor'
    row :actor2               , :element, 0, 0,  30,  50, 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'
    row :callout              , :element, 0, 0, 160, 120, 'shape=callout'
    row :callout2             , :element, 0, 0, 160, 160, 'shape=mxgraph.basic.oval_callout'
    row :callout3             , :element, 0, 0, 160, 160, 'shape=mxgraph.basic.cloud_callout'
    row :callout4             , :element, 0, 0, 160, 120, 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'
    row :circle               , :element, 0, 0, 160, 160, 'ellipse'
    row :cloud                , :element, 0, 0, 160, 160, 'shape=cloud'
    row :container            , :element, 0, 0, 160, 160, 'swimlane'
    row :container2           , :element, 0, 0, 160, 160, 'swimlane;horizontal=0'
    row :container3           , :element, 0, 0, 160, 160, 'swimlane;startSize=50'
    row :container4           , :element, 0, 0, 160, 160, 'swimlane;resizable=0'
    row :cross                , :element, 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'
    row :envelop              , :element, 0, 0, 160, 100, 'shape=message'
    row :database             , :element, 0, 0, 160,  80, 'shape=mxgraph.flowchart.database;strokeWidth=1'
    row :db_json              , :element, 0, 0, 160,  40, 'shape=mxgraph.flowchart.database;strokeWidth=1'
    row :diamond              , :element, 0, 0, 100, 100, 'rhombus'
    row :document             , :element, 0, 0, 160, 160, 'shape=mxgraph.basic.document'
    row :ellipse              , :element, 0, 0, 200, 120, 'ellipse'
    row :hexagon              , :element, 0, 0, 200, 120, 'shape=hexagon'
    row :interface            , :element, 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :klass                , :element, 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :note                 , :element, 0, 0, 160, 160, 'shape=note'
    row :process              , :element, 0, 0, 200, 120, 'shape=process'
    row :rectangle            , :element, 0, 0, 200, 120, ''
    row :rectangle2           , :element, 0, 0, 200, 120, 'shape=mxgraph.basic.cloud_rect'
    row :square               , :element, 0, 0, 160, 160, ''
    row :step                 , :element, 0, 0, 120,  80, 'shape=step;perimeter=stepPerimeter;fixedSize=1'
    row :tick                 , :element, 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'
    row :todo                 , :element, 0, 0, 300,  60, ''
    row :face                 , :element, 0, 0, 100, 100, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'
    row :triangle             , :element, 0, 0, 100, 100, 'triangle'

    # configuration for embedded element shape
    # note that the width / height probably should be driven of parent shape
    row :embed_row            , :element, 0, 0, 200,  40, 'shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;top=0;left=0;bottom=1;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest'
    row :embed_col50          , :element, 0, 0,  50,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden'
    row :embed_col200         , :element, 0, 0, 150,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;align=left;spacingLeft=6;overflow=hidden'
  end

  action do
    data = self.raw_data
    content = {
      strokes: data['strokes'],
      connector: {
        compass: data['connector_compass'],
        waypoints: data['connector_waypoints'],
        arrows: data['connector_arrows'],
        design: data['connector_design']
      },
      shapes: data['shapes'],
    }

    k_builder
      .cd(:data)
      .add_file('shapes.json', content: JSON.pretty_generate(content), on_exist: :write)
  end
end


