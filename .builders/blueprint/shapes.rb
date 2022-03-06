KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  table :shapes do
    fields [:type, :x, :y, :w, :h, :style_modifiers]

    # row :shape      , x: 0, y: 0, w:  20, h:  20, style_modifiers: ''
    row :callout    , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=callout'
    row :circle     , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;ellipse'
    row :cloud      , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=cloud'
    row :diamond    , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;rhombus'
    row :ellipse    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;ellipse'
    row :hexagon    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=hexagon'
    row :note       , x: 0, y: 0, w: 160, h: 160, style_modifiers: 'double=1;shape=note'
    row :process    , x: 0, y: 0, w: 200, h: 120, style_modifiers: 'double=1;shape=process'
    row :rectangle  , x: 0, y: 0, w: 200, h: 120, style_modifiers: ''
    row :square     ,  0,  0,  160,  160,  ''
    
  end

  action do
    data = self.raw_data
    shapes = JSON.pretty_generate(data['shapes'])

    k_builder
      .cd(:data)
      .add_file('shapes.json', content: shapes, on_exist: :write)
  end
end
