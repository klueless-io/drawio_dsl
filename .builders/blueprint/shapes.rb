KManager.model :shapes, namespace: %i[domain] do
  # microapp = import(:handlebars_helpers, :microapp)

  table :shapes do
    fields [:type, :x, :y, :w, :h, :style_modifiers]

    # shape is a custom object
    # row :shape      , 0, 0,  20,  20, ''

    row :callout    , 0, 0, 160, 160, 'shape=callout'
    row :circle     , 0, 0, 160, 160, 'ellipse'
    row :cloud      , 0, 0, 160, 160, 'shape=cloud'
    row :diamond    , 0, 0, 160, 160, 'rhombus'
    row :ellipse    , 0, 0, 200, 120, 'ellipse'
    row :hexagon    , 0, 0, 200, 120, 'shape=hexagon'
    row :hcontainer , 0, 0, 200, 120, 'swimlane;horizontal=0'
    row :note       , 0, 0, 160, 160, 'shape=note'
    row :process    , 0, 0, 200, 120, 'shape=process'
    row :rectangle  , 0, 0, 200, 120, ''
    row :square     , 0, 0, 160, 160, ''
    row :vcontainer , 0, 0, 200, 120, 'swimlane'

  end

  action do
    data = self.raw_data
    shapes = JSON.pretty_generate(data['shapes'])

    k_builder
      .cd(:data)
      .add_file('shapes.json', content: shapes, on_exist: :write)
  end
end
