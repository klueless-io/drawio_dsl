KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  # other settings
  # strokeWidth: 1-n
  # when there is an arrow at beginning
  # startFill=1,0
  # when there is an arrow at end
  # endFill=1,0

  table :strokes do
    fields %i[key style]

    row :dash                 , 'dashed=1;fixDash=1'
    row :dot                  , 'dashed=1;fixDash=1;dashPattern=1 4'
    row :dash_dot             , 'dashed=1;fixDash=1;dashPattern=10 5 1 5'
    row :dash_dot_dot         , 'dashed=1;fixDash=1;dashPattern=10 5 1 5 1 5'
    row :dot_dot_dot          , 'dashed=1;fixDash=1;dashPattern=1 2'
    row :long_dash            , 'dashed=1;fixDash=1;dashPattern=16 6'
    row :dash_long_dash       , 'dashed=1;fixDash=1;dashPattern=10 6 16 6'
    row :dash24               , 'dashed=1;fixDash=1;dashPattern=3 8'
    row :dash32               , 'dashed=1;fixDash=1;dashPattern=6 5'
    row :dash44               , 'dashed=1;fixDash=1;dashPattern=8 8'
  end

  table :connector_compass_points do
    fields %i[key x y]

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
    fields %i[key style]

    row :single , ''
    row :double , 'shape=link'
    row :fat1   , 'shape=flexArrow'
    row :fat2   , 'shape=arrow'
  end

  table :connector_arrows do
    fields %i[key image fill]

    row :none                       , 'none'        , 1
    row :box                        , 'box'         , 1
    row :open_box                   , 'box'         , 0
    row :simple                     , 'open'        , 1
    row :simple_thin                , 'openThin'    , 1
    row :arrow                      , 'block'       , 1
    row :open_arrow                 , 'block'       , 0
    row :arrow_thin                 , 'blockThin'   , 1
    row :open_arrow_thin            , 'blockThin'   , 0
    row :arrow_double               , 'doubleBlock' , 1
    row :open_arrow_double          , 'doubleBlock' , 0
    row :diamond                    , 'diamond'     , 1
    row :open_diamond               , 'diamond'     , 0
    row :diamond_thin               , 'diamondThin' , 1
    row :open_diamond_thin          , 'diamondThin' , 0
    row :circle                     , 'oval'        , 1
    row :open_circle                , 'oval'        , 0
    row :half_circle                , 'halfCircle'  , 1
    row :plus_circle                , 'circlePlus'  , 1
    row :open_plus_circle           , 'circlePlus'  , 0
    row :cross                      , 'cross'       , 1
    row :short                      , 'classicThin' , 1
    row :open_short                 , 'classicThin' , 0
    row :default                    , 'classic'     , 1
    row :open_default               , 'classic'     , 0
    row :none                       , 'none'        , 1
    row :open_none                  , 'none'        , 0
    row :skewed_dash                , 'dash'        , 1
    row :er_many                    , 'ERmany'      , 1
    row :er_one                     , 'ERone'       , 1
    row :er_one_optional            , 'ERzeroToOne' , 1
    row :er_one_mandatory           , 'ERmandOne'   , 1
    row :er_many_optional           , 'ERzeroToMany', 1
    row :er_many_optional           , 'ERzeroToMany', 0
    row :er_many_mandatory          , 'ERoneToMany' , 1
    row :er_many_mandatory          , 'ERoneToMany' , 0
    row :async                      , 'async'       , 1
    row :async                      , 'async'       , 0

  end

  table :connector_waypoints do # aka edgeStyle
    fields %i[key style]

    row :straight                 , 'edgeStyle=none'
    row :orthogonal               , 'edgeStyle=orthogonalEdgeStyle'
    row :orthogonal_curved        , 'edgeStyle=orthogonalEdgeStyle;curved=1'
    row :orthogonal_rounded       , 'edgeStyle=orthogonalEdgeStyle;rounded=1'
    row :elbow                    , 'edgeStyle=elbowEdgeStyle'
    row :elbow_curved             , 'edgeStyle=elbowEdgeStyle;curved=1'
    row :elbow_rounded            , 'edgeStyle=elbowEdgeStyle;rounded=1'
    row :elbow_vertical           , 'edgeStyle=elbowEdgeStyle;elbow=vertical'
    row :isometric                , 'edgeStyle=isometricEdgeStyle'
    row :isometric_curved         , 'edgeStyle=isometricEdgeStyle;curved=1'
    row :isometric_rounded        , 'edgeStyle=isometricEdgeStyle;rounded=1'
    row :isometric_vertical       , 'edgeStyle=isometricEdgeStyle;elbow=vertical'
    row :entity_relation          , 'edgeStyle=entityRelationEdgeStyle'
    row :entity_relation_curved   , 'edgeStyle=entityRelationEdgeStyle;curved=1'
    row :entity_relation_rounded  , 'edgeStyle=entityRelationEdgeStyle;rounded=1'
  end

  table :lines do
    fields %i[category key style_modifiers design stroke] # need to add support for waypoint, don't think I need support for exit or entry

    # style="whiteSpace=wrap;html=1;fillColor=#e6d0de;strokeColor=#996185;edgeStyle=none;shape=link;"
    # style="whiteSpace=wrap;html=1;fillColor=#e6d0de;strokeColor=#996185;edgeStyle=none"
    row :line   , :solid          
    row :line   , :dash           , stroke: :dash
    row :line   , :dot            , stroke: :dot
    row :line   , :dash_dot       , stroke: :dash_dot
    row :line   , :dash_dot_dot   , stroke: :dash_dot_dot
    row :line   , :dot_dot_dot    , stroke: :dot_dot_dot
    row :line   , :long_dash      , stroke: :long_dash
    row :line   , :dash_long_dash , stroke: :dash_long_dash
    row :line   , :dash24         , stroke: :dash24
    row :line   , :dash32         , stroke: :dash32
    row :line   , :dash44         , stroke: :dash44

    row :line   , :double         , design: :double
    row :line   , :double_dash    , design: :double, stroke: :dash
    row :line   , :double_dot     , design: :double, stroke: :dot
  end

  table :texts do
    fields %i[category key x y w h style_modifiers]
  
      # configuration for general purpose shapes
    row :text   , :h1             , 0, 0, 100,  50, 'text;fontSize=89;fontStyle=1;fillColor=none'
    row :text   , :h2             , 0, 0, 100,  50, 'text;fontSize=67;fontStyle=1;fillColor=none'
    row :text   , :h3             , 0, 0, 100,  50, 'text;fontSize=50;fontStyle=1;fillColor=none'
    row :text   , :h4             , 0, 0, 100,  50, 'text;fontSize=37;fontStyle=1;fillColor=none'
    row :text   , :h5             , 0, 0, 100,  50, 'text;fontSize=28;fontStyle=1;fillColor=none'
    row :text   , :h6             , 0, 0, 100,  50, 'text;fontSize=21;fontStyle=1;fillColor=none'
    row :text   , :p              , 0, 0, 100,  50, 'text;fontSize=16;fontStyle=1;fillColor=none'
  end

  table :elements do
    fields %i[category key x y w h style_modifiers]

    row :element, :actor          , 0, 0,  40,  50, 'shape=actor'
    row :element, :actor2         , 0, 0,  30,  50, 'shape=umlActor;verticalLabelPosition=bottom;outlineConnect=1'
    row :element, :callout        , 0, 0, 160, 120, 'shape=callout'
    row :element, :callout2       , 0, 0, 160, 160, 'shape=mxgraph.basic.oval_callout'
    row :element, :callout3       , 0, 0, 160, 160, 'shape=mxgraph.basic.cloud_callout'
    row :element, :callout4       , 0, 0, 160, 120, 'shape=mxgraph.basic.roundRectCallout;dx=30;dy=15;size=5;boundedLbl=1;'
    row :element, :circle         , 0, 0, 160, 160, 'ellipse'
    row :element, :cloud          , 0, 0, 160, 160, 'shape=cloud'
    row :element, :container      , 0, 0, 160, 160, 'swimlane'
    row :element, :container2     , 0, 0, 160, 160, 'swimlane;horizontal=0'
    row :element, :container3     , 0, 0, 160, 160, 'swimlane;startSize=50'
    row :element, :container4     , 0, 0, 160, 160, 'swimlane;resizable=0'
    row :element, :cross          , 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;html=1;shape=mxgraph.basic.x'
    row :element, :envelop        , 0, 0, 160, 100, 'shape=message'
    row :element, :database       , 0, 0, 160,  80, 'shape=mxgraph.flowchart.database;strokeWidth=1'
    row :element, :db_json        , 0, 0, 160,  40, 'shape=mxgraph.flowchart.database;strokeWidth=1'
    row :element, :diamond        , 0, 0, 100, 100, 'rhombus'
    row :element, :document       , 0, 0, 160, 160, 'shape=mxgraph.basic.document'
    row :element, :ellipse        , 0, 0, 200, 120, 'ellipse'
    row :element, :group          , 0, 0, 210, 210, 'fontSize=20;verticalAlign=top'
    row :element, :hexagon        , 0, 0, 200, 120, 'shape=hexagon'
    row :element, :interface      , 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :element, :klass          , 0, 0, 160, 160, 'align=left;overflow=fill;fontSize=12;fontFamily=Helvetica'
    row :element, :note           , 0, 0, 160, 160, 'shape=note'
    row :element, :process        , 0, 0, 200, 120, 'shape=process'
    row :element, :rectangle      , 0, 0, 200, 120, ''
    row :element, :rectangle2     , 0, 0, 200, 120, 'shape=mxgraph.basic.cloud_rect'
    row :element, :square         , 0, 0, 160, 160, ''
    row :element, :step           , 0, 0, 120,  80, 'shape=step;perimeter=stepPerimeter;fixedSize=1'
    row :element, :tick           , 0, 0,  50,  50, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.tick'
    row :element, :todo           , 0, 0, 300,  60, ''
    row :element, :face           , 0, 0, 100, 100, 'verticalLabelPosition=bottom;verticalAlign=top;shape=mxgraph.basic.smiley'
    row :element, :triangle       , 0, 0, 100, 100, 'triangle'

    # configuration for embedded element shape
    # note that the width / height probably should be driven of parent shape
    row :element, :embed_row      , 0, 0, 200,  40, 'shape=partialRectangle;collapsible=0;dropTarget=0;pointerEvents=0;top=0;left=0;bottom=1;right=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest'
    row :element, :embed_col50    , 0, 0,  50,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden'
    row :element, :embed_col200   , 0, 0, 150,  40, 'shape=partialRectangle;connectable=0;top=0;left=0;bottom=0;right=0;align=left;spacingLeft=6;overflow=hidden'
  end

  table :background_themes do
    fields %i[favourite key bg_color font_color]

    # alternative source: https://www.quackit.com/css/css_color_codes.cfm
    # source: https://www.w3schools.com/colors/colors_hex.asp
    row 0, :navy                    , '#000080', '#FFFFFF'
    row 0, :dark_blue               , '#00008B', '#FFFFFF'
    row 0, :medium_blue             , '#0000CD', '#FFFFFF'
    row 0, :blue                    , '#0000FF', '#FFFFFF'
    row 0, :dark_green              , '#006400', '#FFFFFF'
    row 0, :green                   , '#008000', '#FFFFFF'
    row 1, :teal                    , '#008080', '#FFFFFF'
    row 0, :dark_cyan               , '#008B8B', '#FFFFFF'
    row 1, :deep_sky_blue           , '#00BFFF', '#FFFFFF'
    row 1, :dark_turquoise          , '#00CED1', '#FFFFFF'
    row 0, :medium_spring_green     , '#00FA9A', '#1F2D3D'
    row 0, :lime                    , '#00FF00', '#FFFFFF'
    row 0, :spring_green            , '#00FF7F', '#1F2D3D'
    row 0, :aqua                    , '#00FFFF', '#1F2D3D'
    row 0, :cyan                    , '#00FFFF', '#1F2D3D'
    row 0, :midnight_blue           , '#191970', '#FFFFFF'
    row 0, :dodger_blue             , '#1E90FF', '#FFFFFF'
    row 0, :light_sea_green         , '#20B2AA', '#FFFFFF'
    row 0, :forest_green            , '#228B22', '#FFFFFF'
    row 0, :sea_green               , '#2E8B57', '#FFFFFF'
    row 0, :dark_slate_gray         , '#2F4F4F', '#FFFFFF'
    row 0, :dark_slate_grey         , '#2F4F4F', '#FFFFFF'
    row 0, :lime_green              , '#32CD32', '#FFFFFF'
    row 0, :medium_sea_green        , '#3CB371', '#FFFFFF'
    row 0, :turquoise               , '#40E0D0', '#1F2D3D'
    row 1, :royal_blue              , '#4169E1', '#FFFFFF'
    row 1, :steel_blue              , '#4682B4', '#FFFFFF'
    row 0, :dark_slate_blue         , '#483D8B', '#FFFFFF'
    row 0, :medium_turquoise        , '#48D1CC', '#1F2D3D'
    row 0, :indigo                  , '#4B0082', '#FFFFFF'
    row 0, :dark_olive_green        , '#556B2F', '#FFFFFF'
    row 0, :cadet_blue              , '#5F9EA0', '#FFFFFF'
    row 1, :cornflower_blue         , '#6495ED', '#FFFFFF'
    row 0, :rebecca_purple          , '#663399', '#FFFFFF'
    row 0, :medium_aqua_marine      , '#66CDAA', '#1F2D3D'
    row 0, :dim_gray                , '#696969', '#FFFFFF'
    row 0, :dim_grey                , '#696969', '#FFFFFF'
    row 0, :slate_blue              , '#6A5ACD', '#FFFFFF'
    row 0, :olive_drab              , '#6B8E23', '#FFFFFF'
    row 0, :slate_gray              , '#708090', '#FFFFFF'
    row 0, :slate_grey              , '#708090', '#FFFFFF'
    row 0, :light_slate_gray        , '#778899', '#FFFFFF'
    row 0, :light_slate_grey        , '#778899', '#FFFFFF'
    row 0, :medium_slate_blue       , '#7B68EE', '#FFFFFF'
    row 0, :lawn_green              , '#7CFC00', '#1F2D3D'
    row 0, :chartreuse              , '#7FFF00', '#1F2D3D'
    row 0, :aquamarine              , '#7FFFD4', '#1F2D3D'
    row 0, :maroon                  , '#800000', '#FFFFFF'
    row 0, :purple                  , '#800080', '#FFFFFF'
    row 0, :olive                   , '#808000', '#FFFFFF'
    row 0, :gray                    , '#808080', '#FFFFFF'
    row 0, :grey                    , '#808080', '#FFFFFF'
    row 0, :sky_blue                , '#87CEEB', '#1F2D3D'
    row 0, :light_sky_blue          , '#87CEFA', '#1F2D3D'
    row 0, :blue_violet             , '#8A2BE2', '#FFFFFF'
    row 0, :dark_red                , '#8B0000', '#FFFFFF'
    row 0, :dark_magenta            , '#8B008B', '#FFFFFF'
    row 0, :saddle_brown            , '#8B4513', '#FFFFFF'
    row 1, :dark_sea_green          , '#8FBC8F', '#1F2D3D'
    row 0, :light_green             , '#90EE90', '#1F2D3D'
    row 0, :medium_purple           , '#9370DB', '#FFFFFF'
    row 0, :dark_violet             , '#9400D3', '#FFFFFF'
    row 0, :pale_green              , '#98FB98', '#1F2D3D'
    row 0, :dark_orchid             , '#9932CC', '#FFFFFF'
    row 0, :yellow_green            , '#9ACD32', '#1F2D3D'
    row 0, :sienna                  , '#A0522D', '#FFFFFF'
    row 0, :brown                   , '#A52A2A', '#FFFFFF'
    row 0, :dark_gray               , '#A9A9A9', '#1F2D3D'
    row 0, :dark_grey               , '#A9A9A9', '#1F2D3D'
    row 0, :light_blue              , '#ADD8E6', '#1F2D3D'
    row 0, :green_yellow            , '#ADFF2F', '#1F2D3D'
    row 0, :pale_turquoise          , '#AFEEEE', '#1F2D3D'
    row 1, :light_steel_blue        , '#B0C4DE', '#1F2D3D'
    row 0, :powder_blue             , '#B0E0E6', '#1F2D3D'
    row 1, :fire_brick              , '#B22222', '#FFFFFF'
    row 0, :dark_golden_rod         , '#B8860B', '#FFFFFF'
    row 0, :medium_orchid           , '#BA55D3', '#FFFFFF'
    row 1, :rosy_brown              , '#BC8F8F', '#1F2D3D'
    row 0, :dark_khaki              , '#BDB76B', '#1F2D3D'
    row 0, :silver                  , '#C0C0C0', '#1F2D3D'
    row 0, :medium_violet_red       , '#C71585', '#FFFFFF'
    row 1, :indian_red              , '#CD5C5C', '#FFFFFF'
    row 0, :peru                    , '#CD853F', '#FFFFFF'
    row 0, :chocolate               , '#D2691E', '#FFFFFF'
    row 1, :tan                     , '#D2B48C', '#1F2D3D'
    row 0, :light_gray              , '#D3D3D3', '#1F2D3D'
    row 0, :light_grey              , '#D3D3D3', '#1F2D3D'
    row 0, :thistle                 , '#D8BFD8', '#1F2D3D'
    row 0, :orchid                  , '#DA70D6', '#1F2D3D'
    row 0, :golden_rod              , '#DAA520', '#1F2D3D'
    row 0, :pale_violet_red         , '#DB7093', '#FFFFFF'
    row 0, :crimson                 , '#DC143C', '#FFFFFF'
    row 0, :gainsboro               , '#DCDCDC', '#1F2D3D'
    row 0, :plum                    , '#DDA0DD', '#1F2D3D'
    row 1, :burly_wood              , '#DEB887', '#1F2D3D'
    row 0, :light_cyan              , '#E0FFFF', '#1F2D3D'
    row 0, :lavender                , '#E6E6FA', '#1F2D3D'
    row 0, :dark_salmon             , '#E9967A', '#1F2D3D'
    row 0, :violet                  , '#EE82EE', '#1F2D3D'
    row 0, :pale_golden_rod         , '#EEE8AA', '#1F2D3D'
    row 0, :light_coral             , '#F08080', '#1F2D3D'
    row 0, :khaki                   , '#F0E68C', '#1F2D3D'
    row 0, :alice_blue              , '#F0F8FF', '#1F2D3D'
    row 0, :honey_dew               , '#F0FFF0', '#1F2D3D'
    row 0, :azure                   , '#F0FFFF', '#1F2D3D'
    row 0, :sandy_brown             , '#F4A460', '#1F2D3D'
    row 1, :wheat                   , '#F5DEB3', '#1F2D3D'
    row 0, :beige                   , '#F5F5DC', '#1F2D3D'
    row 0, :white_smoke             , '#F5F5F5', '#1F2D3D'
    row 0, :mint_cream              , '#F5FFFA', '#1F2D3D'
    row 0, :ghost_white             , '#F8F8FF', '#1F2D3D'
    row 0, :salmon                  , '#FA8072', '#1F2D3D'
    row 0, :antique_white           , '#FAEBD7', '#1F2D3D'
    row 1, :linen                   , '#FAF0E6', '#1F2D3D'
    row 1, :light_golden_rod_yellow , '#FAFAD2', '#1F2D3D'
    row 1, :pale_gray               , '#FAFAFA', '#1F2D3D'
    row 0, :pale_grey               , '#FAFAFA', '#1F2D3D'
    row 0, :old_lace                , '#FDF5E6', '#1F2D3D'
    row 0, :red                     , '#FF0000', '#FFFFFF'
    row 0, :fuchsia                 , '#FF00FF', '#FFFFFF'
    row 0, :magenta                 , '#FF00FF', '#FFFFFF'
    row 0, :deep_pink               , '#FF1493', '#FFFFFF'
    row 0, :orange_red              , '#FF4500', '#FFFFFF'
    row 0, :tomato                  , '#FF6347', '#FFFFFF'
    row 0, :hot_pink                , '#FF69B4', '#1F2D3D'
    row 0, :coral                   , '#FF7F50', '#1F2D3D'
    row 0, :dark_orange             , '#FF8C00', '#1F2D3D'
    row 0, :light_salmon            , '#FFA07A', '#1F2D3D'
    row 0, :orange                  , '#FFA500', '#1F2D3D'
    row 0, :light_pink              , '#FFB6C1', '#1F2D3D'
    row 0, :pink                    , '#FFC0CB', '#1F2D3D'
    row 0, :gold                    , '#FFD700', '#1F2D3D'
    row 1, :peach_puff              , '#FFDAB9', '#1F2D3D'
    row 0, :navajo_white            , '#FFDEAD', '#1F2D3D'
    row 0, :moccasin                , '#FFE4B5', '#1F2D3D'
    row 0, :bisque                  , '#FFE4C4', '#1F2D3D'
    row 0, :misty_rose              , '#FFE4E1', '#1F2D3D'
    row 0, :blanched_almond         , '#FFEBCD', '#1F2D3D'
    row 0, :papaya_whip             , '#FFEFD5', '#1F2D3D'
    row 0, :lavender_blush          , '#FFF0F5', '#1F2D3D'
    row 0, :sea_shell               , '#FFF5EE', '#1F2D3D'
    row 1, :cornsilk                , '#FFF8DC', '#1F2D3D'
    row 0, :lemon_chiffon           , '#FFFACD', '#1F2D3D'
    row 0, :floral_white            , '#FFFAF0', '#1F2D3D'
    row 1, :snow                    , '#FFFAFA', '#1F2D3D'
    row 0, :yellow                  , '#FFFF00', '#1F2D3D'
    row 0, :light_yellow            , '#FFFFE0', '#1F2D3D'
    row 1, :ivory                   , '#FFFFF0', '#1F2D3D'
  end

  table :element_themes do
    fields %i[key fill_color stroke_color font_color gradient]

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

    lookup = data['lines'] + data['texts'] + data['elements']

    content = {
      shape: {
        lookup: lookup.map { |shape| { key: shape['key'], category: shape['category'] } },
        elements: data['elements'],
        lines: data['lines'],
        texts: data['texts']
      },
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
      strokes: data['strokes']
    }

    k_builder
      .cd(:app)
      .add_file('config/configuration.json', content: JSON.pretty_generate(content), on_exist: :write)

    generate_code
  end
end

def generate_code
  shapes_file = k_builder.target_folders.get_filename(:app, 'config/configuration.json')
  shapes_configuration = JSON.parse(File.read(shapes_file))
  shapes = shapes_configuration['shape']
  lookup = shapes['lookup']
  elements = shapes['elements']
  lines = shapes['lines']
  texts = shapes['texts']

  # strokes = shapes_configuration['strokes']

  KDirector::Dsls::BasicDsl
    .init(k_builder,
      on_exist:                   :write,                      # %i[skip write compare]
      on_action:                  :execute                    # %i[queue execute]
    )
    .blueprint(
      active: true,
      on_exist: :write) do

      cd(:lib)

      add('schema/_.rb',
        template_file: 'schema_require.rb',
        elements: elements,
        lines: lines,
        texts: texts)

      elements.each do |element|
        add("schema/elements/#{element['key']}.rb",
          template_file: 'schema_element.rb',
          element: element)
      end

      lines.each do |line|
        add("schema/lines/#{line['key']}.rb",
          template_file: 'schema_line.rb',
          line: line)
      end

      texts.each do |text|
        add("schema/texts/#{text['key']}.rb",
          template_file: 'schema_text.rb',
          text: text)
      end

      add("drawio_shapes.rb"        , template_file: 'drawio_shapes.rb'       , shapes: lookup, shape_length: lookup.length)
      add("dom_builder_shapes.rb"   , template_file: 'dom_builder_shapes.rb'  , shapes: lookup)

      cd(:spec)

      # build spec for each shape
      elements.each do |element|
        add("schema/elements/#{element['key']}_spec.rb",
          template_file: 'schema_element_spec.rb',
          element: element)
      end

      lines.each do |line|
        add("schema/lines/#{line['key']}_spec.rb",
          template_file: 'schema_line_spec.rb',
          line: line)
      end

      texts.each do |text|
        add("schema/texts/#{text['key']}_spec.rb",
          template_file: 'schema_text_spec.rb',
          text: text)
      end

      cd(:app)
      run_command('rubocop -a')

    end
end
