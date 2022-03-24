m = KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  # other settings
  # strokeWidth: 1-n
  # when there is an arrow at beginning
  # startFill=1,0
  # when there is an arrow at end
  # endFill=1,0

  table :strokes do
    fields %i[type style]

    row :dashed               , 'dashed=1;fixDash=1'
    row :dotted               , 'dashed=1;fixDash=1;dashPattern=1 4'
    row :dash_dot             , 'dashed=1;fixDash=1;dashPattern=10 5 1 5'
    row :dash_dot_dot         , 'dashed=1;fixDash=1;dashPattern=10 5 1 5 1 5'
    row :dot_dot_dot          , 'dashed=1;fixDash=1;dashPattern=1 2'
    row :long_dash            , 'dashed=1;fixDash=1;dashPattern=16 6'
    row :dash_long_dash       , 'dashed=1;fixDash=1;dashPattern=10 6 16 6'
    row :dashed24             , 'dashed=1;fixDash=1;dashPattern=3 8'
    row :dashed32             , 'dashed=1;fixDash=1;dashPattern=6 5'
    row :dashed44             , 'dashed=1;fixDash=1;dashPattern=8 8'
  end

  table :connector_compass_points do
    fields %i[type x y]

    row :n  , x: 0.5 , y: 0       # 'exitX=0.5;exitY=0;exitDx=0;exitDy=0'  'entryX=0.5;entryY=0;entryDx=0;entryDy=0'
    row :ne , x: 1   , y: 0       # 'exitX=1;exitY=0;exitDx=0;exitDy=0'    'entryX=1;entryY=0;entryDx=0;entryDy=0'
    row :e  , x: 1   , y: 0.5     # 'exitX=1;exitY=0.5;exitDx=0;exitDy=0'  'entryX=1;entryY=0.5;entryDx=0;entryDy=0'
    row :se , x: 1   , y: 1       # 'exitX=1;exitY=1;exitDx=0;exitDy=0'    'entryX=1;entryY=1;entryDx=0;entryDy=0'
    row :s  , x: 0.5 , y: 1       # 'exitX=0.5;exitY=1;exitDx=0;exitDy=0'  'entryX=0.5;entryY=1;entryDx=0;entryDy=0'
    row :sw , x: 0   , y: 1       # 'exitX=0;exitY=1;exitDx=0;exitDy=0'    'entryX=0;entryY=1;entryDx=0;entryDy=0'
    row :w  , x: 0   , y: 0.5     # 'exitX=0;exitY=0.5;exitDx=0;exitDy=0'  'entryX=0;entryY=0.5;entryDx=0;entryDy=0'
    row :nw , x: 0   , y: 0       # 'exitX=0;exitY=0;exitDx=0;exitDy=0'    'entryX=0;entryY=0;entryDx=0;entryDy=0'
  end

  table :connector_designs do
    fields [:type, :style]

    row :style1, ''
    row :style2, 'shape=link'
    row :style3, 'shape=flexArrow'
    row :style4, 'shape=arrow'
  end

  table :connector_arrows do
    fields [:type, :style]

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
    fields [:type, :style]

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

    row :solid                , :line   , 0, 0,  50,  50, 'edgeStyle=none;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0'
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
    row :h1                   , :text   , 0, 0, 100,  50, 'text;fontSize=89;fontStyle=1;fillColor=none'
    row :h2                   , :text   , 0, 0, 100,  50, 'text;fontSize=67;fontStyle=1;fillColor=none'
    row :h3                   , :text   , 0, 0, 100,  50, 'text;fontSize=50;fontStyle=1;fillColor=none'
    row :h4                   , :text   , 0, 0, 100,  50, 'text;fontSize=37;fontStyle=1;fillColor=none'
    row :h5                   , :text   , 0, 0, 100,  50, 'text;fontSize=28;fontStyle=1;fillColor=none'
    row :h6                   , :text   , 0, 0, 100,  50, 'text;fontSize=21;fontStyle=1;fillColor=none'
    row :p                    , :text   , 0, 0, 100,  50, 'text;fontSize=16;fontStyle=1;fillColor=none'

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
    row :group                , :element, 0, 0, 210, 210, 'fontSize=20;verticalAlign=top'
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

  table :background_themes do
    fields [:type, :bg_color, :font_color]

    row :style_01, '#f5f5f5', '#aaaaaa'
    row :style_02, '#dae8fc', '#aaaaaa'
    row :style_03, '#d5e8d4', '#aaaaaa'
    row :style_04, '#ffe6cc', '#aaaaaa'
    row :style_05, '#fff2cc', '#aaaaaa'
    # row :style_06, '#f8cecc', '#aaaaaa'
    # row :style_07, '#e1d5e7', '#aaaaaa'
    # row :style_08, '#60a917', '#aaaaaa'
    # row :style_09, '#008a00', '#aaaaaa'
    # row :style_10, '#1ba1e2', '#aaaaaa'
    # row :style_11, '#0050ef', '#aaaaaa'
    # row :style_12, '#6a00ff', '#aaaaaa'
    # row :style_13, '#aa00ff', '#aaaaaa'
    # row :style_14, '#d80073', '#aaaaaa'
    # row :style_15, '#a20025', '#aaaaaa'
    # row :style_16, '#e51400', '#aaaaaa'
    # row :style_17, '#fa6800', '#aaaaaa'
    # row :style_18, '#f0a30a', '#aaaaaa'
    # row :style_19, '#e3c800', '#aaaaaa'
    # row :style_20, '#6d8764', '#aaaaaa'
    # row :style_21, '#647687', '#aaaaaa'
    # row :style_22, '#76608a', '#aaaaaa'
    # row :style_23, '#a0522d', '#aaaaaa'
    # row :style_24, '#fad7ac', '#aaaaaa'
    # row :style_25, '#fad9d5', '#aaaaaa'
    # row :style_26, '#b0e3e6', '#aaaaaa'
    # row :style_27, '#b1ddf0', '#aaaaaa'
    # row :style_28, '#d0cee2', '#aaaaaa'
    # row :style_29, '#bac8d3', '#aaaaaa'
    # row :style_30, '#f5f5f5', '#aaaaaa'
    # row :style_31, '#dae8fc', '#aaaaaa'
    # row :style_32, '#d5e8d4', '#aaaaaa'
    # row :style_33, '#ffcd28', '#aaaaaa'
    # row :style_34, '#fff2cc', '#aaaaaa'
    # row :style_35, '#f8cecc', '#aaaaaa'
    # row :style_36, '#e6d0de', '#aaaaaa'
    # row :style_37, '#eeeeee', '#aaaaaa'
    # row :style_38, '#f9f7ed', '#aaaaaa'
    # row :style_39, '#ffcc99', '#aaaaaa'
    # row :style_40, '#cce5ff', '#aaaaaa'
    # row :style_41, '#ffff88', '#aaaaaa'
    # row :style_42, '#cdeb8b', '#aaaaaa'
    # row :style_43, '#ffcccc', '#aaaaaa'
  end

  table :element_themes do
    fields [:type, :fill_color, :stroke_color, :font_color, :gradient]

    row :style_01, '#f5f5f5', '#666666', '#333333'
    row :style_02, '#dae8fc', '#6c8ebf', '#333333'
    row :style_03, '#d5e8d4', '#82b366', '#333333'
    row :style_04, '#ffe6cc', '#d79b00', '#333333'
    row :style_05, '#fff2cc', '#d6b656', '#333333'
    row :style_06, '#f8cecc', '#b85450', '#333333'
    row :style_07, '#e1d5e7', '#9673a6', '#333333'
    row :style_08, '#60a917', '#2D7600', '#ffffff'
    row :style_09, '#008a00', '#005700', '#ffffff'
    row :style_10, '#1ba1e2', '#006EAF', '#ffffff'
    row :style_11, '#0050ef', '#001DBC', '#ffffff'
    row :style_12, '#6a00ff', '#3700CC', '#ffffff'
    row :style_13, '#aa00ff', '#7700CC', '#ffffff'
    row :style_14, '#d80073', '#A50040', '#ffffff'
    row :style_15, '#a20025', '#6F0000', '#ffffff'
    row :style_16, '#e51400', '#B20000', '#ffffff'
    row :style_17, '#fa6800', '#C73500', '#000000'
    row :style_18, '#f0a30a', '#BD7000', '#000000'
    row :style_19, '#e3c800', '#B09500', '#000000'
    row :style_20, '#6d8764', '#3A5431', '#ffffff'
    row :style_21, '#647687', '#314354', '#ffffff'
    row :style_22, '#76608a', '#432D57', '#ffffff'
    row :style_23, '#a0522d', '#6D1F00', '#ffffff'
    row :style_24, '#fad7ac', '#b46504', '#333333'
    row :style_25, '#fad9d5', '#ae4132', '#333333'
    row :style_26, '#b0e3e6', '#0e8088', '#000000'
    row :style_27, '#b1ddf0', '#10739e', '#000000'
    row :style_28, '#d0cee2', '#56517e', '#000000'
    row :style_29, '#bac8d3', '#23445d', '#000000'
    row :style_30, '#f5f5f5', '#666666', '#000000', '#b3b3b3'
    row :style_31, '#dae8fc', '#6c8ebf', '#000000', '#7ea6e0'
    row :style_32, '#d5e8d4', '#82b366', '#000000', '#97d077'
    row :style_33, '#ffcd28', '#d79b00', '#000000', '#ffa500'
    row :style_34, '#fff2cc', '#d6b656', '#000000', '#ffd966'
    row :style_35, '#f8cecc', '#b85450', '#000000', '#ea6b66'
    row :style_36, '#e6d0de', '#996185', '#000000', '#d5739d'
    row :style_37, '#eeeeee', '#36393d', '#000000'
    row :style_38, '#f9f7ed', '#36393d', '#000000'
    row :style_39, '#ffcc99', '#36393d', '#000000'
    row :style_40, '#cce5ff', '#36393d', '#000000'
    row :style_41, '#ffff88', '#36393d', '#000000'
    row :style_42, '#cdeb8b', '#36393d', '#000000'
    row :style_43, '#ffcccc', '#36393d', '#000000'
  end

  action do
    data = self.raw_data
    content = {
      strokes: data['strokes'],
      connector: {
        compass_points: data['connector_compass_points'],
        waypoints: data['connector_waypoints'],
        arrows: data['connector_arrows'],
        designs: data['connector_designs'],
      },
      theme: {
        elements: data['element_themes'],
        backgrounds: data['background_themes']
      },
      shapes: data['shapes'],
    }

    k_builder
      .cd(:app)
      .add_file('config/configuration.json', content: JSON.pretty_generate(content), on_exist: :write)
  end
end


